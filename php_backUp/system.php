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

        <h2>INSERT: Customer data</h2>
        <form method="POST" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="insertCustomer" name="insertCustomer">
            Phone: <input type="text" name="customer_phone"> <br /><br />
            Member: <input type="text" name="customer_member_id"> <br /><br />
            Name: <input type="text" name="customer_name"> <br /><br />

            <input type="submit" value="Insert" name="insertSubmit"></p>
        </form>
        <br>
        <?php
        $displayPhone = $_POST["customer_phone"];
        $displayMember = $_POST["customer_member_id"];
        $displayName = $_POST["customer_name"];
        echo "Phone: $displayPhone <br>";
        echo "Member: $displayMember <br>";
        echo "Name: $displayName <br>";
        ?>

        <hr />

        <h2>INSERT: Create Order</h2>
        <form method="POST" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="insertOrder" name="insertOrder">
            Order Number: <input type="text" name="order_number"> <br /><br />
            Phone: <input type="text" name="order_customer_phone"> <br /><br />

            <input type="submit" value="Insert" name="insertSubmit"></p>
        </form>
        <br>
        <?php
        $displayNumber = $_POST["order_number"];
        $displayCustomerPhone = $_POST["order_customer_phone"];
        echo "Order Number: $displayNumber <br>";
        echo "Phone: $displayCustomerPhone <br>";
        ?>

        <hr />

        <h2>INSERT: Order meal</h2>
        <form method="POST" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="insertContains" name="insertContains">
            Order Number: <input type="text" name="contains_order_number"> <br /><br />
            Meal ID: <input type="text" name="meal_id"> <br /><br />

            <input type="submit" value="Insert" name="insertSubmit"></p>
        </form>
        <br>
        <?php
        $diplayConatinsNumber = $_POST["contains_order_number"];
        $displayMealId = $_POST["meal_id"];
        echo "Order Number: $diplayConatinsNumber <br>";
        echo "Meal ID: $displayMealId <br>";
        ?>

        <hr />

        <h2>UPDATE: Customer information</h2>
        <p>The values are case sensitive and if you enter in the wrong case, the update statement will not do anything.</p>

        <form method="POST" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="updateQueryRequest" name="updateQueryRequest">
            Old Phone: <input type="text" name="oldCustomerPhone"> <br /><br />
            New Phone: <input type="text" name="newCustomerPhone"> <br /><br />

            <input type="submit" value="Update" name="updateSubmit"></p>
        </form>
        <br>
        <?php
        $displayNewPhone = $_POST["newCustomerPhone"];
        echo "$displayNewPhone <br>";
        ?>

        <hr />

        <h2>DELETE: Orders</h2>
        <p>The values are case sensitive and if you enter in the wrong case, the update statement will not do anything.</p>

        <form method="POST" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="deleteOrdersRequest" name="deleteOrdersRequest">
            Order Number: <input type="text" name="orderNumToDelete"> <br /><br />

            <input type="submit" value="Insert" name="insertSubmit"></p>
        </form>
        <br>
        <?php
        $displayNewPhone = $_POST["orderNumToDelete"];
        echo "Deleted $displayNewPhone <br>";
        ?>

        <hr />

        <h2>SELECT: Find meal ID</h2>
        <p>Insert meal name and a minimun price to find meal ID that matches the name and greater than the insert price.</p>
        <form method="GET" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="selectFindMealId" name="selectFindMealId">
            Meal Name: <input type="text" name="find_meal_name"> <br /><br />
            Meal Price: <input type="text" name="find_meal_price"> <br /><br />

            <input type="submit" name="selectId"></p>
        </form>

        <hr />

        <h2>PROJECTION: List Meal data</h2>
        <p>(meal_id, meal_name, meal_price)</p>
        <form method="GET" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="projectionMeal" name="projectionMeal">
            Select 1: <input type="text" name="project_meal_var1"> <br /><br />
            Select 2: <input type="text" name="project_meal_var2"> <br /><br />
            Select 3: <input type="text" name="project_meal_var3"> <br /><br />

            <input type="submit" name="projectData"></p>
        </form>

        <hr />

        <h2>PROJECTION: List Staff data</h2>
        <p>This one is just another example (staff_id, staff_name)</p>
        <form method="GET" action="system.php"> <!--refresh page when submitted-->
        <form method="GET" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="projectionStaff" name="projectionStaff">
            Select 1: <input type="text" name="project_staff_var1"> <br /><br />
            Select 2: <input type="text" name="project_staff_var2"> <br /><br />

            <input type="submit" name="projectData1"></p>
        </form>

        <hr />

        <h2>JOIN: Order details</h2>
        <p>Find the orders details by order number, allowing users to know the price and items</p>
        <form method="GET" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="joinOrderWMeal" name="joinOrderWMeal">
            Order Number: <input type="text" name="join_order_number"> <br /><br />

            <input type="submit" name="joinOrder"></p>
        </form>

        <hr />

        <h2>Aggregation with Group By: Order price sum</h2>
        <p>Sum order total by selecting Order Oumber</p>
        <form method="GET" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="groupBySum" name="groupBySum">
            Order Number: <input type="text" name="select_order_to_sum"> <br /><br />

            <input type="submit" name="sumOrder"></p>
        </form>

        <hr />

        <h2>Aggregation with Having: Total Items Ordered</h2>
        <p>Find Orders has Meals that is greater than the input number</p>
        <form method="GET" action="system.php"> <!--refresh page when submitted-->
            <input type="hidden" id="havingItemsGreaterThan" name="havingItemsGreaterThan">
            Order size: <input type="text" name="having_greater"> <br /><br />

            <input type="submit" name="havingGreaterCount"></p>
        </form>

        <hr />

        <h2>Display the Member table</h2>
        <form method="GET" action="system.php"> <!--refresh page when submitted-->
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

            echo "<table>";
            
            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }

        function printMealResult($result) { //prints results from a select statement
            //echo "test";

            echo "<table>";
            
            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td></tr>"; //or just use "echo $row[0]" 
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

        function handleResetRequest() {
            global $db_conn;
            // Drop old table
            executePlainSQL("DROP TABLE member");

            // Create new table
            echo "<br> creating new table <br>";
            executePlainSQL("CREATE TABLE member (member_id int PRIMARY KEY, member_name char(30))");
            OCICommit($db_conn);
        }

        // INSERT
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

            $result = executePlainSQL("SELECT * FROM customer");

            echo "</table>";

            echo "<br>Retrieved data from Customer:<br>";
            echo "<table>";
            echo "<tr><th>Phone</th><th>Member</th><th>Name</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }

        // INSERT
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

        // INSERT
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

        // DELETE
        function deleteOrders() {
            global $db_conn;

            $deleteOrdNum = $_POST['orderNumToDelete'];
            
            executePlainSQL("DELETE FROM orders WHERE order_number= '" . $deleteOrdNum . "'");
            OCICommit($db_conn);

            $result = executePlainSQL("SELECT * FROM orders");

            echo "<br>Retrieved data from Orders:<br>";
            echo "<table>";
            echo "<tr><th>Order Number</th><th>Phone</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            $result1 = executePlainSQL("SELECT * FROM contains");

            echo "</table>";

            echo "<br>Retrieved data from Contains:<br>";
            echo "<table>";
            echo "<tr><th>Order Number</th><th>Meal ID</th></tr>";

            while ($row = OCI_Fetch_Array($result1, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";

            
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

        // UPDATE
        function updateCustomer() {
            global $db_conn;

            $old_phone = $_POST['oldCustomerPhone'];
            $new_phone = $_POST['newCustomerPhone'];

            // you need the wrap the old name and new name values with single quotations
            executePlainSQL("UPDATE customer SET phone=" . $new_phone . " WHERE phone=" . $old_phone . "");
            OCICommit($db_conn);

            $result = executePlainSQL("SELECT * FROM customer");

            echo "</table>";

            echo "<br>Retrieved data from Customer:<br>";
            echo "<table>";
            echo "<tr><th>Phone</th><th>Member</th><th>Name</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }

        // SELECT
        function handleFindMealId() {
            global $db_conn;

            $findMealName = $_GET['find_meal_name'];
            $findMealPrice = $_GET['find_meal_price'];
           // echo "test";

            $result = executePlainSQL("SELECT meal.meal_id FROM meal WHERE meal_name = '" . $findMealName . "' AND meal_price> '". $findMealPrice ."'");
           // echo "test";

            echo "<br>Meal ID found<br>";
            echo "<table>";
            echo "<tr><th>ID</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }

        // PROJECTION
        function handleProjection() {
            global $db_conn;

            $s1 = $_GET['project_meal_var1'];
            $s2 = $_GET['project_meal_var2'];
            $s3 = $_GET['project_meal_var3'];

            $list = [$s1, $s2, $s3];

            $list = implode(', ', array_filter($list));

            if (empty($list)) {
                $list = '*';
            }

            $result = executePlainSQL("SELECT " . $list . " FROM meal");

            echo "<br>Data from Customer<br>";
            echo "<table>";
            echo "<tr><th>$s1</th><th>$s2</th><th>$s3</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }

        // PROJECTION
        function handleProjectionStaff() {
            global $db_conn;

            $s1 = $_GET['project_staff_var1'];
            $s2 = $_GET['project_staff_var2'];

            $list = [$s1, $s2];

            $list = implode(', ', array_filter($list));

            if (empty($list)) {
                $list = '*';
            }

            $result = executePlainSQL("SELECT " . $list . " FROM staff");

            echo "<br>Data from Customer<br>";
            echo "<table>";
            echo "<tr><th>$s1</th><th>$s2</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }

        // JOIN
        function handleOrderDetails() {
            global $db_conn;

            $joinOrderNum = $_GET['join_order_number'];
           // echo "test";

            $result = executePlainSQL("SELECT c.order_number, m.meal_id, m.meal_name, m.meal_price FROM contains c JOIN meal m ON c.meal_id=m.meal_id WHERE c.order_number='". $joinOrderNum ."'");

            echo "<br>Order details<br>";
            echo "<table>";
            echo "<tr><th>Number</th><th>ID</th><th>Name</th><th>Price</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }

        // Aggregation with Group By
        function handleGroupByOrderSum() {
            global $db_conn;

            $selectOrderNum = $_GET['select_order_to_sum'];

            $result = executePlainSQL("SELECT c.order_number, SUM(m.meal_id) FROM contains c JOIN meal m ON c.meal_id=m.meal_id WHERE c.order_number='" . $selectOrderNum . "' group by c.order_number");

            echo "<br>Order Sum<br>";
            echo "<table>";
            echo "<tr><th>Number</th><th>Sum</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }

        // Aggregation with Having
        function handleGroupByHavingItemsOrdered() {
            global $db_conn;

            $inputOrderCount = $_GET['having_greater'];

            $result = executePlainSQL("SELECT o.customer_phone, count(c.order_number) AS order_count FROM orders o JOIN contains c ON o.order_number=c.order_number GROUP BY o.customer_phone HAVING COUNT(c.order_number)>'" . $inputOrderCount . "'");

            echo "<br>Items Ordered<br>";
            echo "<table>";
            echo "<tr><th>Phone</th><th>Count</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }


        // HANDLE ALL POST ROUTES
	// A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
        function handlePOSTRequest() {
            if (connectToDB()) {
                if (array_key_exists('resetTablesRequest', $_POST)) {
                    handleResetRequest();
                } else if (array_key_exists('insertCustomer', $_POST)) {
                    insertCustomer();
                } else if (array_key_exists('insertOrder', $_POST)) {
                    insertOrder();
                } else if (array_key_exists('insertContains', $_POST)) {
                    insertContains();
                } else if (array_key_exists('updateQueryRequest', $_POST)) {
                    updateCustomer();
                } else if (array_key_exists('deleteOrdersRequest', $_POST)) {
                    deleteOrders();
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
                } else if (array_key_exists('selectId', $_GET)) {
                    handleFindMealId();
                } else if (array_key_exists('joinOrder', $_GET)) { 
                    handleOrderDetails();
                } else if (array_key_exists('projectData', $_GET)) {
                    handleProjection();
                } else if (array_key_exists('sumOrder', $_GET)) {
                    handleGroupByOrderSum();
                } else if (array_key_exists('havingGreaterCount', $_GET)) { 
                    handleGroupByHavingItemsOrdered();
                }  else if (array_key_exists('projectData1', $_GET)) {
                    handleProjectionStaff();
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
        } else if (isset($_GET['selectFindMealId'])) {
            handleGETRequest();
        } else if (isset($_GET['joinOrderWMeal'])) {
            handleGETRequest();
        } else if (isset($_GET['projectionMeal'])) {
            handleGETRequest();
        } else if (isset($_GET['groupBySum'])) {
            handleGETRequest();
        } else if (isset($_GET['havingItemsGreaterThan'])) {
            handleGETRequest();
        } else if (isset($_GET['projectionStaff'])) {
            handleGETRequest();
        }
		?>
	</body>
</html>