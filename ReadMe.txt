Welcome to FuseForum
--------------------

FuseForum is a complete discussion forum system written in ColdFusion and using the Fusebox Framework.

v0.002 Alpha 15 June 2007
-------------------------
I have added the circuits for the Admin functions. 
There is a new Site Table and you will have to add at least one record to that manually to get going.

You will also need to have some users in the user table. 
By default you will be logged in as user 2, this is hardcoded and can be changed but there is still no login facility.

Use the http://127.0.0.1/Fuseforum/index.cfm?fuseaction=ForumAdmin.Categories to get to a page where you can add a new forum.

There is the beginning of user management features you can now assign users as moderators.

v0.001 Alpha 14 June 2007
-------------------------
The current version uses MS SQL Server 2000 as a database.

The current version is being tested with CF 7.02 and CF 8.

You will need to separately download a copy of the fusebox framework version 5.1 from the fusebox web site http://www.fusebox.org where the latest version is always downloadable.

Please read the install details in the install directory to install it.

It is based on a version written a long time ago in Fusebox 2 then converted to Fusebox 3 and then converted to Fusebox 4 so it has some history. It has been extracted from a bigger application so may have bugs where it used to interface to somthing that is not there any more.

At this stage of the project it is quite likely that I will reorganise the database. I am not making any commitment to provide facilities to move data from this version to any later version of the database.

Known Issues
------------
Currently there are likely to be a fair few hardcoded file paths. I am changing these as I find them.

There is no user management or login facility. In the meantime you will have to manage users using SQL server tools.

I will be adding the login soon. Beacuse of the lack of login I have hardcoded a setting so that everyone is logged in as userid=2.

This is just so that I can try things out.

There is no sensible page layout. It is being developed so that the pages will look nice. Right now it looks like pages looked in 1995!


kevin@objectiveinternet.com