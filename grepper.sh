rm grep_result.txt
echo -e "8100: bcm_xgs\n\n" >> grep_result.txt
grep -Hrn "8100" iom/bcm_xgs/ >> grep_result.txt

echo -e "\n81: bcm_xgs\n\n" >> grep_result.txt
grep -Hrn "81" iom/bcm_xgs/ >> grep_result.txt

echo -e "\n8100: bcmhost\n\n" >> grep_result.txt
grep -Hrn "8100" bcmhost/ >> grep_result.txt

echo -e "\n81: bcmhost\n\n" >> grep_result.txt
grep -Hrn "81" bcmhost/ >> grep_result.txt

