$path = ".\Process.csv"
$header ="UserID","FirstLastName","Version","InsuranceCompany"



import-csv -path $path -header $header| sort FirstLastName | export-CSV c:\Temp\outfile.csv -UseCulture -Encoding UTF8
$csv = Import-Csv c:\Temp\outfile.csv

foreach($line in $csv)
	{ 
 		$properties = $line | Get-Member -MemberType Properties
   			for($i=0; $i -lt $properties.Count;$i++)
    				{
        				$column = $properties[$i]
        				$columnvalue = $line  | Select -ExpandProperty $column.Name
					$filenam=$columnvalue
						if ($column -like "*Insurance*")  
							{
								Add-Content .\$filenam.txt  $properties
								
							}     
        				# doSomething $i $columnvalue 
    				}
	} 
