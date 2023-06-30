String toPersianNumber(String input) 
{
  String persianNumbers = '۰۱۲۳۴۵۶۷۸۹';
  String englishNumbers = '0123456789';

  String result = '';
  for (int i = 0; i < input.length; i++) 
  {
    int index = englishNumbers.indexOf(input[i]);
    if (index != -1) 
    {
      result += persianNumbers[index];
    } 
    else 
    {
      result += input[i];
    }
  }
  return result;
}

String toEnglishNumber(String input) 
{
  String persianNumbers = '۰۱۲۳۴۵۶۷۸۹';
  String englishNumbers = '0123456789';

  String result = '';
  for (int i = 0; i < input.length; i++) 
  {
    int index = persianNumbers.indexOf(input[i]);
    if (index != -1) 
    {
      result += englishNumbers[index];
    } 

    else 
    {
      result += input[i];
    }
  }
  
  return result;
}