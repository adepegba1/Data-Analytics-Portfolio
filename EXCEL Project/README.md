# This folder contains all work related to Excel spreadsheet
- Microsoft Excel is an application that is used for recording, analyzing and visualizing data. It is in the form of spreadsheet. It comprises of 3 branches as a Data Analyist: **Data Entry**, **Data Analytics**, and **Data Visualization**
- Data is the combination of attributes and values. Attributes are the column head while values are the object in the data
- Protection in Excel: To protect Excel workbooks at the file level or at the workshhet level. There are three levels of password protection to open a file, password protection for changing the file structure, such as adding, deleting or hiding worksheets.

  |Protection|Description|
  |---|---|
  |WOOKBOOK|Prevent users from altering the structure of the workbook including adding or deleting sheets and displaying hidden worksheets. You can also prevent users from changing the size of the position of worksheet windows. **STEPS** Open the Excel file you wish to secure. Navigate to **FILE** go to **INFO** move to **PROTECT WORKBOOK** choose **ENCRYPT WITH PASSWORD**. This protection wont allow screenshot of data without the password |
  |WORKSHEET|Prevents users from making changes to a worksheet. You can specify the elements that users are allowed to change. **STEPS** Open the Excel file you wish to secure. Navigate to **FILE** go to **INFO** move to **PROTECT WORKBOOK** choose **PROTECT CURRENT SHEET**. This can also screenshoot without the passowrd if encrypt with password isnt done on the file|
  |CELLS|Cells are locked by default in a protected worksheet. Users cannot edit, insert, delete or formats cells. You can unlock cells that users are able to edit. **STEPS** Open the Excel file you wish to secure. Select all the cells in the worksheet with CRTL+A, Right-click and navigate to **FORMAT CELLS**, go to **PROTECTION TAB** and uncheck the **LOCKED**. After that select  the cell you want to lock and right-click and navigate to **FORMAT CELLS**, go to **PROTECTION TAB** and check the **LOCKED**. Then movw to the **REVIEW TAB** and **PROTECT SHEET**, Enter the passowrd to lock the cell you want to lock|

  - [Errors In Excel](https://www.shiksha.com/online-courses/articles/what-are-excel-errors-and-how-to-fix-them/)
  - Steps to Data Cleaning: Data cleaning is a process of fixing or removing incorrect, corrupted, incorrectly formatted, duplicate or incomplete data within a dataset. The following are the steps to Data cleaning.[Read More](https://trumpexcel.com/clean-data-in-excel/)

|Steps| Description| What to do|
|---|---|---|
|REMOVE DUPLICATE| This step is to remove any irrelevant duplicate data in the dataset|Go to Conditional Formating, Highlight Cell Rules, Duplicate Values, After that, filter by colour|
|FILL UP BLANKS CELLS| This step is to fill all blanks cells in your data with something| After hightlighting all the sheet, Press F5, special, blanks, Fill blank number column with Zero(0), blanks text and Date column with 'NA', after putting a value to one cell, press ctrl+enter|
|CHECK FOR ERROR IN SPELLING| In this process, you check for any typograhpy error in the dataset that isnt correct English words| Review tab, navigate to spelling, choose the language you want the check for spelling, ignore all means all the errors in the data with same name will be ignore, change all means all the errors in the data with same name will be change to what you select|
|REMOVE ALL FORMATTINGS| Formatting are rules that have been apply to the dataset that may affect your work like cell colour, borders and alignment| In the home tab, navigate to Editing group, click the arrow near the clear button, clear format|
|CONVERT DATA TO PROPER CASES| This steps is to make the data to cases needed for the data| You use either PROPER, UPPER or LOWER formula by adding new column and copy, paste the value and delete the original column|
|PARSE DATA USING TEXT COLUMN| Data that are text file will need to pass through this step| On Data tab, navigate to text to column, choose the delimiters use in the text file, all data will be in each column now|
|CONVERT DATA STORED IN TEXT TO NUMBER|In Excel, text are align from the left while number are align from the right. If numbers in the data are align from the left, you need this process|Select the cell that number are store as text, there will be a small box on the left, click convert to number|
|USING THE FIND AND REPLACE|Find function helps you to locate what have you wish to look for in the data and Replace is a function that look for what you are finding and replace it with what you want|Highlight the column, on the home tab, Editing group, Find and Replace|
|HIGHLIGHING EXCEL ERROR|This step is to make all excel error in the data to be highlighted to see it very clear|highlight all the data, On home tab, style group, conditiona formatting, manage rules either current selection or wooksheet, new rules, format only cell that contain, format cells with: Error, format and add style to view the error|
|GETTING RID OF WHITESPACE| This is having excess space or trailing whitespace in the data|Using the Trim formula for the step|


