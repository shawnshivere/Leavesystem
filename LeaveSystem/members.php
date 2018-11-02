<?php
include("header.php");

if(session_id() == ""){
    redirect_user("login.php");
}

$members = array("Emmanu Baro"=>"FMS/2173/15","Shawn Agesa"=>"FMS/0002/16",
    "Rosalia Mwai"=>"FMS/2181/15","Sam Kariuki"=>"FMS/2013/14",
        "Dennis Maigua"=>"FMS/2182/15","David ."=>"FMS/1851/14");
?>
<div class="container my-5">
    <div class="card">
        <table class="table table-bordered table-responsive-xl">
            <thead class="thead-light">

            <th>Name</th>
            <th>ID</th>
            </thead>

            <?php
            foreach($members as $key=>$value){

            echo "<tr><td>$key</td><td>$value</td></tr>";

            }
        echo "</table>

    </div>
</div>";
        ?>
