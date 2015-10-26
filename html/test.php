<?php




$fullContent = file_get_contents('../helion/horizon/horizon_overview.html'); 
preg_match_all('/<body[^>]*>(.*)<\/body>/Usi',$fullContent,$contentArray); 
echo $contentArray[1][0];  