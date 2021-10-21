<?php 
if (function_exists($_GET['f_name'])) {
    $_GET['f_name']();
}

function get_all_fields(){
    require_once "../../config/connection.php";
    $sql = "SELECT * from fields where deleted_at is null";
    $query = mysqli_query($connect,$sql);
    $html = "";
    $no = 1;
    while ($row = mysqli_fetch_array($query)) {
        $html .= "<tr>
                        <td>".$no++."</td>
                        <td>".$row['field_name']."</td>
                        <td>".$row['note']."</td>
                        <td>".$row['price']."</td>
                        <td>
                            <div class='btn-group' role='group'>
                                <button type='button' class='btn btn-sm btn-warning' onclick='getFieldbyId(".$row['id_field'].")'><i class='fa fa-pen'></i></button>
                                <button type='button' id='warning' class='btn btn-sm btn-danger warning'><i class='fa fa-trash'></i></button>
                            </div>
                        </td>
                    </tr>";
    }

    echo $html;
}

function get_field_by_id(){
    require_once "../../config/connection.php";
    $id = $_GET['data'];
    $sql = "SELECT * from fields where id_field='$id' and deleted_at is null";
    $query = mysqli_query($connect,$sql);
    $data = mysqli_fetch_assoc($query);
    echo json_encode($data);
}


?>