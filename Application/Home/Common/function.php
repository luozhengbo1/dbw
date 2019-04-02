<?php

function myTrim($str)
{
    $str = trim($str); // 过滤两边的空格
    $str = preg_replace('/($s*$)|(^s*^)/m', '', $str);
    return str_replace(array(
        '　',
        ' ',
        '  ',
        ' ',
        ' ',
        ' ',
        '       ',
        PHP_EOL,
        '	',
        '\t',
        '\r'
    ), '', $str); // 替换全角空格为空
}
// 正则匹配
function myNum($str)
{
    preg_match_all('/([a-zA-Z0-9]+)/', $str, $match);
    return $match[0][0];
}

// curl
function http($url, $params = null, $method = 'GET', $header = array(), $multi = false)
{
    $opts = array(
        CURLOPT_TIMEOUT => 60,
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSL_VERIFYHOST => false,
        CURLOPT_HTTPHEADER => $header,

    );
    
    /* 根据请求类型设置特定参数 */
    switch (strtoupper($method)) {
        case 'GET':
            $opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
            break;
        case 'POST':
            // 判断是否传输文件
            $params = $multi ? $params : http_build_query($params);
            $opts[CURLOPT_URL] = $url;
            $opts[CURLOPT_POST] = 1;
            $opts[CURLOPT_POSTFIELDS] = $params;

            break;
        default:
            throw new Exception('不支持的请求方式！');
    }
    
    /* 初始化并执行curl请求 */
    $ch = curl_init();
    curl_setopt_array($ch, $opts);
    $data = curl_exec($ch);
    $error = curl_error($ch);
    curl_close($ch);
    if ($error)
        throw new Exception('请求发生错误：' . $error);
    return $data;
}
function myLog($model,$data='',$operate=''){
	
	$modelLog = M($model);
	$dataLog['name'] = session('username');
	$dataLog['content'] = json_encode($data,JSON_UNESCAPED_SLASHES);
	$dataLog['operate'] = $operate;
	$dataLog['add_time'] = date('Y-m-d H:i:s');
	$modelLog->add($dataLog);	
	
	
}
function generateTree($list, $pk='id', $pid = 'pid', $child = 'child', $root = 0) {
    // 创建Tree
    $tree = array();
    if(is_array($list)) {
        // 创建基于主键的数组引用
        $refer = array();
        foreach ($list as $key => $data) {
            $refer[$data[$pk]] =& $list[$key];		
		}

        foreach ($list as $key => $data) {
            // 判断是否存在parent
            $parentId =  $data[$pid];
            if ($root == $parentId) {
                $tree[] =& $list[$key];
            }else{
                if (isset($refer[$parentId])) {
                    $parent =& $refer[$parentId];
                    $parent[$child][] =& $list[$key];
                }else{
					//20180110新增
					return $refer;
				}
            }
        }

    }
    return $tree;
}
function mkOptGroup($list){
	
	foreach ($list as $key => $value) {

		$optgroup [] = $value['gp_title'];
	}
		
	$optgroup = array_unique ($optgroup);
	
	foreach ($list as $key => $value) {

	
		foreach($optgroup as $k => $v){
			
	
			
			if($v == $value['gp_title']){
				

				$opt[$k]['option'][] = array(
					'id' => $value['id'],
					'title' => $value['title'],
					'note' => $value['note'],
					'add_time' => $value['add_time'],
					'gp_id' => $value['gp_id'],
				);
				
				$opt[$k]['optgroup'] = $value['gp_title'];			

				
			}else{
				
			}
			
		}
	}	
	
	return $opt;
}
/*
	页码分类
*/

function setShowPage($showNum = 3,$pageNum = 1, $pageCount = 1){

	//当前页面小于1 则为1
	$page = $pageNum<1 ? 1 : $pageNum;
	//当前页大于总页数 则为总页数
	$page = $pageNum > $pageCount ? $pageCount : $pageNum;
	//页数小当前页 则为当前页
	$pages = $pageCount < $pageNum ? $pageNum : $pageCount;
	 
	//计算开始页
	$startNum = intval($page - floor($showNum/2));
	$startNum = intval($startNum<1 ? 1 : $startNum);
	//计算结束页
	$endNum = $page + floor($showNum/2);
	$endNum = $endNum>$pages? $pages : $endNum;
	 
	//当前显示的页码个数不够最大页码数，在进行左右调整
	$currNum = $endNum - $startNum+1;
	//左调整
	if($currNum<$showNum && $startNum>1){  
		$startNum = $startNum - ($showNum-$currNum);
		$startNum = $startNum<1 ? 1 : $startNum;
		$currNum = $endNum - $startNum+1;
	}
	//右边调整
	if($currNum<$showNum && $endNum<$pages){ 
		$endNum = $endNum + ($showNum-$currNum);
		$endNum = $endNum>$pages? $pages : $endNum;
	}
	
	return array('startNum' => $startNum,'endNum' => $endNum);
}
function setPageList($showPage,$pageNum,$pageSize,$pageCount,$params){

	$pageList [] = array(
			'name' => '首页',
			'curr' => '0',
			'href' => U(CONTROLLER_NAME.'/'.ACTION_NAME,array_merge(array('pageNum'=>1,'pageSize'=>$pageSize),$params)),	
		);
	if($pageNum > 1){
		$pre = $pageNum - 1;
		$pageList [] = array(
			'name' => '上一页',
			'curr' => '0',
			'href' => U(CONTROLLER_NAME.'/'.ACTION_NAME,array_merge(array('pageNum'=>$pre,'pageSize'=>$pageSize),$params)),	
		);
		$pageList [] = array(
			'name' => '...',
			'curr' => '0',
			'href' => 'javascipt:;',	
		);			
	}

	for ($i=$showPage['startNum'];$i<=$showPage['endNum'];$i++) {
		
		$pageList [] = array(
		
			'name' => $i,
			'curr' => $i == $pageNum ? 1:0,
			'href' => U(CONTROLLER_NAME.'/'.ACTION_NAME,array_merge(array('pageNum'=>$i,'pageSize'=>$pageSize),$params)),	
	
		);
	}
	if($pageNum < $pageCount){
		
		$pageList [] = array(
			'name' => '...',
			'curr' => '0',
			'href' => 'javascipt:;',	
		);	
		
		$next = $pageNum + 1;
		$pageList [] = array(
			
			'name' => '下一页',
			'curr' => '0',
			'href' => U(CONTROLLER_NAME.'/'.ACTION_NAME,array_merge(array('pageNum'=>$next,'pageSize'=>$pageSize),$params)),	
		
		);
		
	}
	
	$pageList [] = array(
		'name' => '尾页',
		'curr' => '0',
		'href' => U(CONTROLLER_NAME.'/'.ACTION_NAME,array_merge(array('pageNum'=>$pageCount,'pageSize'=>$pageSize),$params)),	
	);
	
	return $pageList;
}
function buildOrderNO(){	
	return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}
function outExcel($dataList, $fileName = '', $sheet = false) {
	require_once VENDOR_PATH . 'download-xlsx.php';
	exportExcel ( $dataList, $fileName, $sheet );
	unset ($sheet);
	unset ($dataList);
}
function outExcelForOrder($list){
	
	$str ='';
	foreach ($list as $key =>$value) {
		$str .='<Row>';              
		foreach ($value as $val) {
								
			if(is_array($val)){
				
				foreach ($val as $v) {
					
					$content.=$v['food_name'].'x'.$v['food_num'].';&#10;'; 
					
				}
				unset($val);
				$val = $content;
			}
			
			$str .= '<Cell><Data ss:Type="String">'.$val.'</Data></Cell>';
			$content = '';
		}

		$str .='</Row>';
	}

	
	header('Content-Type: application/vnd.ms-excel');  
	header('Content-Type: application/octet-stream');  
	header('Content-Disposition: attachment;filename="excel('.date('YmdHis').').xls"');  
	$html  = '<?xml version="1.0"?>
			<?mso-application progid="Excel.Sheet"?>
			<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
			 xmlns:o="urn:schemas-microsoft-com:office:office"
			 xmlns:x="urn:schemas-microsoft-com:office:excel"
			 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
			 xmlns:html="http://www.w3.org/TR/REC-html40">
			<ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
			  <WindowHeight>7095</WindowHeight>
			  <WindowWidth>18255</WindowWidth>
			  <WindowTopX>360</WindowTopX>
			  <WindowTopY>30</WindowTopY>
			  <ProtectStructure>False</ProtectStructure>
			  <ProtectWindows>False</ProtectWindows>
			</ExcelWorkbook>
			<Styles>
			  <Style ss:ID="Default" ss:Name="Normal">
			   <Alignment ss:Vertical="Center"/>
			   <Borders/>
			   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="11" ss:Color="#000000"/>
			   <Interior/>
			   <NumberFormat/>
			   <Protection/>
			  </Style>
			  <Style ss:ID="s63">
			   <Alignment ss:Vertical="Center" ss:WrapText="1"/>
			   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="11" ss:Color="#000000"/>
			  </Style>
			</Styles>
			<Worksheet ss:Name="Sheet1">
			  <Table ss:ExpandedColumnCount="'.count($list[0]).'" ss:ExpandedRowCount="'.count($list).'" x:FullColumns="1"
			   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="13.5">
			 '.$str.'
			  </Table>
			  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
			   <PageSetup>
				<Header x:Margin="0.3"/>
				<Footer x:Margin="0.3"/>
				<PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
			   </PageSetup>
			   <Selected/>
			   <ProtectObjects>False</ProtectObjects>
			   <ProtectScenarios>False</ProtectScenarios>
			  </WorksheetOptions>
			 </Worksheet>
			</Workbook>';
	
	echo $html;	
	
}

?>