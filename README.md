# Automation Sheet :
https://docs.google.com/spreadsheets/d/1FDZ8L6LYcej_PaijWCw3CDEjFyl7GcbqfYjgBRP1qs4/edit#gid=2111852133
# Git Session Record:
https://drive.google.com/file/d/170nZkPLPP15D4dH1qNjTpO22X7FMdo4E/view

# ***ALWAYS CHECK UR BRANCH BEFORE WORKING***
# WorkFlow
	as a contreputer :
		- Create a task Ticket in the project with the branch/task name and move it to "InProgress"
		- CHECK WHERE YOU ARE (the branch you're working on)
		- Clone the Repo
		- Create Branch for ur task with the same name as the ticket		ex: CT_LOGINPAGE
		- start implementation
		- Commit & Push  >>> LOCAL = REMOTE 
		- Move the Task to Ready for Merge 
		- repeat until the feature/Sprint is done	ex: CATALOGE finished as feature 
# Branches Hierarchy
	- MASTER Branch>	
		- Integration Branch>			ex: ZID_INTEGRATION
			- Feature Branch>			ex: Catalog
				- Task Branch>			ex: CT_LOGINPAGE
# POM Content:
	- Libraries
	- Locators 
	- Global Variables
	- Keywords (Actions)
# Naming Convention
	- Locators 
		- button :			btn			ex: login_btn
		- drop down button :		ddb
		- text field :			field			ex: "email_Field"
		- radio button :		Rbtn
		- check box:			chk
	- Global varaibles		ALL CAPS			ex: "MD_LOGIN_EMAIL"
	- local variables		all small			ex: "md_loging_email"
	- Keywords
		- Actions		<Location_action>		Ex: MD_LoginPage_EnterEmail
		- TestCases
	- PO File >>			<P_Feature_Page>		ex: P_Zidpay_Refund
	- Test File >>			<T_Feature_TestName>		ex: T_Zidship_Activation
	- Branch names >>		<Module_Feature>		ex: ZID_ZIDSHIP
# Review Outlines:
	-Check the Varibles naming convention.
	-Check the affected files.
	-Check the test cases naming so it's the same as in the test cases sheet.
	-check that the steps of the TCs in the framework covers all the steps in the test cases sheet.
	-Check that the TCs are dynamic and generic enough so we can maintain it easily.
	-Don't merge results folder to the master branch.
	-Run the TCs
