<?php
include_once(__DIR__ . "/../Model/M_Student.php");

class Ctrl_Student
{
    public function invoke()
    {
        $modelStudent = new Model_Student();

        // 1. Xem chi tiết sinh viên
        if (isset($_GET['stid'])) {
            $student = $modelStudent->getStudentDetail($_GET['stid']);
            include_once(__DIR__ . "/../View/StudentDetail.html");
        }
        // 2. Chèn thông tin sinh viên
        else if (isset($_GET['mod1'])) {
            if (isset($_POST['insert'])) {
                $name = $_POST['name'];
                $age = $_POST['age'];
                $university = $_POST['university'];
                $modelStudent->insertStudent($name, $age, $university);
                header("Location: C_Student.php");
                exit();
            } else {
                include_once(__DIR__ . "/../View/InsertStudent.html");
            }
        }
        // 3. Cập nhật thông tin sinh viên
        else if (isset($_GET['mod2'])) {
            if (isset($_POST['update'])) {
                $id = $_POST['id'];
                $name = $_POST['name'];
                $age = $_POST['age'];
                $university = $_POST['university'];
                $modelStudent->updateStudent($id, $name, $age, $university);
                header("Location: C_Student.php?mod2=1");
                exit();
            }

            $studentEdit = null;
            if (isset($_GET['edit_id'])) {
                $studentEdit = $modelStudent->getStudentDetail($_GET['edit_id']);
            }
            $studentList = $modelStudent->getAllStudent();
            include_once(__DIR__ . "/../View/UpdateStudent.html");
        }
        // 4. Xóa thông tin sinh viên
        else if (isset($_GET['mod3'])) {
            if (isset($_GET['del_id'])) {
                $modelStudent->deleteStudent($_GET['del_id']);
                header("Location: C_Student.php?mod3=1");
                exit();
            }
            $studentList = $modelStudent->getAllStudent();
            include_once(__DIR__ . "/../View/DeleteStudent.html");
        }
        // 5. Tìm kiếm thông tin sinh viên
        else if (isset($_GET['mod4'])) {
            if (isset($_POST['search'])) {
                $field = $_POST['search_field'];
                $value = $_POST['search_value'];
                $searchResults = $modelStudent->searchStudent($field, $value);
            }
            include_once(__DIR__ . "/../View/SearchStudent.html");
        }
        // Mặc định: Hiển thị danh sách sinh viên
        else {
            $studentList = $modelStudent->getAllStudent();
            include_once(__DIR__ . "/../View/StudentList.html");
        }
    }
}

$C_Student = new Ctrl_Student();
$C_Student->invoke();
?>
