<!--Test Oracle file for UBC CPSC304 2018 Winter Term 1
  Created by Jiemin Zhang
  Modified by Simona Radu
  Modified by Jessica Wong (2018-06-22)
  This file shows the very basics of how to execute PHP commands
  on Oracle.  
  Specifically, it will drop a table, create a table, insert values
  update values, and then query for values
 
  IF YOU HAVE A TABLE CALLED "demoTable" IT WILL BE DESTROYED
  The script assumes you already have a server set up
  All OCI commands are commands to the Oracle libraries
  To get the file to work, you must place it somewhere where your
  Apache server can run it, and you must rename it to have a ".php"
  extension.  You must also change the username and password on the 
  OCILogon below to be your ORACLE username and password -->

  <html>
    <head>
        <title>CPSC 304 PHP/Oracle Demonstration</title>
    </head>

    <body>

        <h2>Insert Customer data</h2>
        <form method="POST" action="db.php"> <!--refresh page when submitted-->
            <input type="hidden" id="insertCustomer" name="insertCustomer">
            Phone: <input type="text" name="customer_phone"> <br /><br />
            Member: <input type="text" name="customer_member_id"> <br /><br />
            Name: <input type="text" name="customer_name"> <br /><br />

            <input type="submit" value="Insert" name="insertSubmit"></p>
        </form>
        <br>
        <?php
        echo $_POST["customer_phone"];
        echo $_POST["customer_member_id"];
        echo $_POST["customer_name"];
        ?>

        <hr />

        <h2>Create Order</h2>
        <form method="POST" action="db.php"> <!--refresh page when submitted-->
            <input type="hidden" id="insertOrder" name="insertOrder">
            Order Number: <input type="text" name="order_number"> <br /><br />
            Phone: <input type="text" name="order_customer_phone"> <br /><br />

            <input type="submit" value="Insert" name="insertSubmit"></p>
        </form>
        <br>
        <?php
        echo $_POST["order_number"];
        echo $_POST["order_customer_phone"];
        ?>

        <hr />

        <h2>Order meal</h2>
        <form method="POST" action="db.php"> <!--refresh page when submitted-->
            <input type="hidden" id="insertContains" name="insertContains">
            Order Number: <input type="text" name="contains_order_number"> <br /><br />
            Meal ID: <input type="text" name="meal_id"> <br /><br />

            <input type="submit" value="Insert" name="insertSubmit"></p>
        </form>
        <br>
        <?php
        echo $_POST["contains_order_number"];
        echo $_POST["meal_id"];
        ?>

        <hr />

        <h2>Update Customer information</h2>
        <p>The values are case sensitive and if you enter in the wrong case, the update statement will not do anything.</p>

        <form method="POST" action="db.php"> <!--refresh page when submitted-->
            <input type="hidden" id="updateQueryRequest" name="updateQueryRequest">
            Phone: <input type="text" name="new_customer_phone"> <br /><br />
            Member: <input type="text" name="new_customer_member_id"> <br /><br />
            Name: <input type="text" name="new_customer_name"> <br /><br />

            <input type="submit" value="Update" name="updateSubmit"></p>
        </form>

        <hr />

        <h2>Count the Tuples in DemoTable</h2>
        <form method="GET" action="db.php"> <!--refresh page when submitted-->
            <input type="hidden" id="countTupleRequest" name="countTupleRequest">
            <input type="submit" name="countTuples"></p>
        </form>

        <hr />

        <h2>Display the Tuples in the DemoTable</h2>
        <form method="GET" action="db.php"> <!--refresh page when submitted-->
            <input type="hidden" id="displayTupleRequest" name="displayTupleRequest">
            <input type="submit" name="displayTuples"></p>
        </form>

        <?php
		//this tells the system that it's no longer just parsing html; it's now parsing PHP

        $success = True; //keep track of errors so it redirects the page only if there are no errors
        $db_conn = NULL; // edit the login credentials in connectToDB()
        $show_debug_alert_messages = False; // set to True if you want alerts to show you which methods are being triggered (see how it is used in debugAlertMessage())

        function debugAlertMessage($message) {
            global $show_debug_alert_messages;

            if ($show_debug_alert_messages) {
                echo "<script type='text/javascript'>alert('" . $message . "');</script>";
            }
        }

        

        function executePlainSQL($cmdstr) { //takes a plain (no bound variables) SQL command and executes it
            //echo "<br>running ".$cmdstr."<br>";
            global $db_conn, $success;

            $statement = OCIParse($db_conn, $cmdstr); 
            //There are a set of comments at the end of the file that describe some of the OCI specific functions and how they work

            if (!$statement) {
                echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
                $e = OCI_Error($db_conn); // For OCIParse errors pass the connection handle
                echo htmlentities($e['message']);
                $success = False;
            }

            $r = OCIExecute($statement, OCI_DEFAULT);
            if (!$r) {
                echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                $e = oci_error($statement); // For OCIExecute errors pass the statementhandle
                echo htmlentities($e['message']);
                $success = False;
            }

			return $statement;
		}

        function executeBoundSQL($cmdstr, $list) {
            /* Sometimes the same statement will be executed several times with different values for the variables involved in the query.
		In this case you don't need to create the statement several times. Bound variables cause a statement to only be
		parsed once and you can reuse the statement. This is also very useful in protecting against SQL injection. 
		See the sample code below for how this function is used */

			global $db_conn, $success;
			$statement = OCIParse($db_conn, $cmdstr);

            if (!$statement) {
                echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
                $e = OCI_Error($db_conn);
                echo htmlentities($e['message']);
                $success = False;
            }

            foreach ($list as $tuple) {
                foreach ($tuple as $bind => $val) {
                    //echo $val;
                    //echo "<br>".$bind."<br>";
                    OCIBindByName($statement, $bind, $val);
                    unset ($val); //make sure you do not remove this. Otherwise $val will remain in an array object wrapper which will not be recognized by Oracle as a proper datatype
				}

                $r = OCIExecute($statement, OCI_DEFAULT);
                if (!$r) {
                    echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                    $e = OCI_Error($statement); // For OCIExecute errors, pass the statementhandle
                    echo htmlentities($e['message']);
                    echo "<br>";
                    $success = False;
                }
            }
        }

        function printResult($result) { //prints results from a select statement
            echo "<br>Retrieved data from table demoTable:<br>";
            echo "<table>";
            echo "<tr><th>ID</th><th>Name</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }

        function connectToDB() {
            global $db_conn;

            // Your username is ora_(CWL_ID) and the password is a(student number). For example, 
			// ora_platypus is the username and a12345678 is the password.
            $db_conn = OCILogon("ora_pushen", "a31696198", "dbhost.students.cs.ubc.ca:1522/stu");

            if ($db_conn) {
                debugAlertMessage("Database is Connected");
                return true;
            } else {
                debugAlertMessage("Cannot connect to Database");
                $e = OCI_Error(); // For OCILogon errors pass no handle
                echo htmlentities($e['message']);
                return false;
            }
        }

        function disconnectFromDB() {
            global $db_conn;

            debugAlertMessage("Disconnect from Database");
            OCILogoff($db_conn);
        }

        function handleUpdateRequest() {
            global $db_conn;

            $old_name = $_POST['oldName'];
            $new_name = $_POST['newName'];

            // you need the wrap the old name and new name values with single quotations
            executePlainSQL("UPDATE demoTable SET name='" . $new_name . "' WHERE name='" . $old_name . "'");
            OCICommit($db_conn);
        }

        function handleResetRequest() {
            global $db_conn;
            // Drop old table
            executePlainSQL("DROP TABLE member");

            // Create new table
            echo "<br> creating new table <br>";
            executePlainSQL("CREATE TABLE member (member_id int PRIMARY KEY, member_name char(30))");
            OCICommit($db_conn);
        }

        function insertCustomer() {
            global $db_conn;

            //Getting the values from user and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['customer_phone'],
                ":bind2" => $_POST['customer_member_id'],
                ":bind3" => $_POST['customer_name']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into customer values (:bind1, :bind2, :bind3)", $alltuples);
            OCICommit($db_conn);
        }

        function insertOrder() {
            global $db_conn;

            //Getting the values from user and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['order_number'],
                ":bind2" => $_POST['order_customer_phone']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into orders values (:bind1, :bind2)", $alltuples);
            OCICommit($db_conn);
        }

        function insertContains() {
            global $db_conn;

            //Getting the values from contains and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['contains_order_number'],
                ":bind2" => $_POST['contains_meal_id']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into contains values (:bind1, :bind2)", $alltuples);
            OCICommit($db_conn);
        }
        
        function insertMember() {
            global $db_conn;

            //Getting the values from member and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['member_id'],
                ":bind2" => $_POST['member_name']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into member values (:bind1, :bind2)", $alltuples);
            OCICommit($db_conn);
        }

        function insertServe() {
            global $db_conn;

            //Getting the values from serve and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['serve_staff_id'],
                ":bind2" => $_POST['serve_customer_phone']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into serve values (:bind1, :bind2)", $alltuples);
            OCICommit($db_conn);
        }

        function insertStaff() {
            global $db_conn;

            //Getting the values from staff and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['staff_id'],
                ":bind2" => $_POST['staff_store_id'],
                ":bind3" => $_POST['staff_name']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into staff values (:bind1, :bind2, :bind3)", $alltuples);
            OCICommit($db_conn);
        }

        function insertStore() {
            global $db_conn;

            //Getting the values from store and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['store_id'],
                ":bind2" => $_POST['store_name'],
                ":bind3" => $_POST['store_address']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into store values (:bind1, :bind2, :bind3)", $alltuples);
            OCICommit($db_conn);
        }

        function insertSendsMealTo() {
            global $db_conn;

            //Getting the values from SendsMealTo and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['sendsMealTo_staff_id'],
                ":bind2" => $_POST['sendsMealTo_store_id'],
                ":bind3" => $_POST['sendsMealTo_workStation_id']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into sendsmealto values (:bind1, :bind2, :bind3)", $alltuples);
            OCICommit($db_conn);
        }

        function insertWorkStation() {
            global $db_conn;

            //Getting the values from WorkStation and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['workStation_store_id'],
                ":bind2" => $_POST['workStation_id'],
                ":bind3" => $_POST['workStation_name']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into workStation values (:bind1, :bind2, :bind3)", $alltuples);
            OCICommit($db_conn);
        }

        function insertCookBy() {
            global $db_conn;

            //Getting the values from CookBy and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['cookBy_store_id'],
                ":bind2" => $_POST['cookBy_workStation_id'],
                ":bind3" => $_POST['cookBy_meal_id']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into cookBy values (:bind1, :bind2, :bind3)", $alltuples);
            OCICommit($db_conn);
        }

        function insertMeal() {
            global $db_conn;

            //Getting the values from Meal and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['meal_id'],
                ":bind2" => $_POST['meal_name'],
                ":bind3" => $_POST['meal_price']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into meal values (:bind1, :bind2, :bind3)", $alltuples);
            OCICommit($db_conn);
        }

        function insertFriedChicken() {
            global $db_conn;

            //Getting the values from FriedChicken and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['friedChicken_meal_id'],
                ":bind2" => $_POST['friedChicken_flavour']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into FriedChicken values (:bind1, :bind2)", $alltuples);
            OCICommit($db_conn);
        }

        function insertDrink() {
            global $db_conn;

            //Getting the values from Drink and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['drink_meal_id'],
                ":bind2" => $_POST['drink_flavour'],
                ":bind3" => $_POST['drink_size'],
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into drinkn values (:bind1, :bind2, :bind3)", $alltuples);
            OCICommit($db_conn);
        }

        function insertFries() {
            global $db_conn;

            //Getting the values from Fries and insert data into the table
            $tuple = array (
                ":bind1" => $_POST['fries_meal_id'],
                ":bind2" => $_POST['fries_size']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into dries values (:bind1, :bind2)", $alltuples);
            OCICommit($db_conn);
        }

        function handleCountRequest() {
            global $db_conn;

            $result = executePlainSQL("SELECT Count(*) FROM demoTable");

            if (($row = oci_fetch_row($result)) != false) {
                echo "<br> The number of tuples in demoTable: " . $row[0] . "<br>";
            }
        }

        function handleDisplayRequest() {
            global $db_conn;
            
            $result = executePlainSQL("SELECT * FROM member");

            printResult($result);
        }

        function updateMember() {
            global $db_conn;
            // Drop old table
            executePlainSQL("DROP TABLE member");

            // Create new table
            echo "<br> creating new table <br>";
            executePlainSQL("CREATE TABLE member (update_member_id int PRIMARY KEY, update_member_name char(40))");
            OCICommit($db_conn);
        }


        // HANDLE ALL POST ROUTES
	// A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
        function handlePOSTRequest() {
            if (connectToDB()) {
                if (array_key_exists('resetTablesRequest', $_POST)) {
                    handleResetRequest();
                } else if (array_key_exists('updateQueryRequest', $_POST)) {
                    handleUpdateRequest();
                } else if (array_key_exists('insertCustomer', $_POST)) {
                    insertCustomer();
                } else if (array_key_exists('insertOrder', $_POST)) {
                    insertOrder();
                } else if (array_key_exists('insertContains', $_POST)) {
                    insertContains();
                } else if (array_key_exists('insertMember', $_POST)) {
                    insertMember();
                } else if (array_key_exists('insertServe', $_POST)) {
                    insertServe();
                } else if (array_key_exists('insertStaff', $_POST)) {
                    insertStaff();
                } else if (array_key_exists('insertStore', $_POST)) {
                    insertStore();
                } else if (array_key_exists('insertSendsMealTo', $_POST)) {
                    insertSendsMealTo();
                } else if (array_key_exists('insertWorkStation', $_POST)) {
                    insertWorkStation();
                } else if (array_key_exists('insertCookBy', $_POST)) {
                    insertCookBy();
                } else if (array_key_exists('insertMeal', $_POST)) {
                    insertMeal();
                } else if (array_key_exists('insertFriedChicken', $_POST)) {
                    insertFriedChicken();
                } else if (array_key_exists('insertDrink', $_POST)) {
                    insertDrink();
                } else if (array_key_exists('insertFries', $_POST)) {
                    insertFries();
                } 
                 disconnectFromDB();
            }
        }

        // HANDLE ALL GET ROUTES
	// A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
        function handleGETRequest() {
            if (connectToDB()) {
                if (array_key_exists('countTuples', $_GET)) {
                    handleCountRequest();
                } else if (array_key_exists('displayTuples', $_GET)) {
                    handleDisplayRequest();
                }

                disconnectFromDB();
            }
        }

		if (isset($_POST['reset']) || isset($_POST['updateSubmit']) || isset($_POST['insertSubmit'])) {
            handlePOSTRequest();
        } else if (isset($_GET['countTupleRequest'])) {
            handleGETRequest();
        } else if (isset($_GET['displayTupleRequest'])) {
            handleGETRequest();
        }
		?>
	</body>
</html>