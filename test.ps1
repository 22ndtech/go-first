clear
echo "----------------- BEGIN TESTING -----------------"
echo "`r`n`r`n`r`n"

export exposed-port = 9091

echo "-----------------------------------------------------------------"
echo "Test1 HTTP:GET localhost:9090/products"
echo "-----------------------------------------------------------------"
Invoke-RestMethod -Method Get http://localhost:9090/products
echo "`r`n`r`n`r`n"


echo "-----------------------------------------------------------------"
echo "Test2 HTTP:POST localhost:9090/products passing in Body = '{}'"
echo "-----------------------------------------------------------------"
Invoke-WebRequest -Method Post http://localhost:9090/products -Body '{}'
echo "`r`n`r`n`r`n"


echo "-----------------------------------------------------------------"
echo "Test3 HTTP:POST localhost:9090/products passing in Body = '{`"name`":`"test-product-1`"}'"
echo "-----------------------------------------------------------------"
Invoke-WebRequest -Method Post http://localhost:9090/products -Body '{"name":"test-product-1"}'
echo "`r`n`r`n`r`n"


echo "-----------------------------------------------------------------"
echo "Test4 HTTP:POST localhost:9090/products passing in Body = '{}'"
echo "-----------------------------------------------------------------"
Invoke-WebRequest -Method Post http://localhost:9090/products -Body '{"name":"test-product-2", "description":"test-product-2 description"}'
echo "`r`n`r`n`r`n"


echo "-----------------------------------------------------------------"
echo "Test5 HTTP:POST localhost:9090/products passing in Body = '{}'"
echo "-----------------------------------------------------------------"
Invoke-WebRequest -Method Post http://localhost:9090/products -Body '{"name":"test-product-3", "description":"test-product-3 description", "price":1.75, "sku": "test-prouduct-3-sku"}'
echo "`r`n`r`n`r`n"


echo "-----------------------------------------------------------------"
echo "Test6 HTTP:PUT localhost:9090/products/2 passing in Body = '{`"name`":`"new-product2-name`", `"description`":`"new-product2 description`", `"price`":1.85, `"sku`": `"new-prouduct-2-sku`"}'"
echo "-----------------------------------------------------------------"
Invoke-WebRequest -Method Put http://localhost:9090/products/2 -Body '{"name":"new-product2-name", "description":"new-product2 description", "price":1.85, "sku": "new-prouduct-2-sku"}'
echo "`r`n`r`n`r`n"


echo "-----------------------------------------------------------------"
echo "Test7 HTTP:DELETE localhost:9090/products"
echo "-----------------------------------------------------------------"
Invoke-WebRequest -Method Delete http://localhost:9090/products/2
echo "`r`n`r`n`r`n"


echo "-----------------------------------------------------------------"
echo "Test8 HTTP:GET localhost:9090/products after running other tests to verify changes"
echo "-----------------------------------------------------------------"
Invoke-RestMethod -Method Get http://localhost:9090/products
echo "`r`n`r`n`r`n"



echo "----------------- END TESTING -----------------"
echo "`r`n`r`n`r`n"