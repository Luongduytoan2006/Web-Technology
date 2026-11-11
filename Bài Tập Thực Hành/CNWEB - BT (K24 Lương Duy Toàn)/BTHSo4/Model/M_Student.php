<?php
include_once(__DIR__ . "/E_Student.php");

class Model_Student
{
    private function getConnect()
    {
        $link = mysqli_connect("localhost", "root", "", "DULIEU");
        if (!$link) {
            die("Không thể kết nối CSDL MySQL: " . mysqli_connect_error());
        }
        mysqli_set_charset($link, "utf8mb4");
        return $link;
    }

    public function getAllStudent()
    {
        $link = $this->getConnect();
        $sql = "SELECT * FROM sinhvien";
        $rs = mysqli_query($link, $sql);
        $students = array();
        $i = 1;
        while ($row = mysqli_fetch_array($rs)) {
            $students[$i++] = new Entity_Student($row['id'], $row['name'], $row['age'], $row['university']);
        }
        mysqli_close($link);
        return $students;
    }

    public function getStudentDetail($stid)
    {
        $link = $this->getConnect();
        $sql = "SELECT * FROM sinhvien WHERE id = '$stid'";
        $rs = mysqli_query($link, $sql);
        $student = null;
        if ($row = mysqli_fetch_array($rs)) {
            $student = new Entity_Student($row['id'], $row['name'], $row['age'], $row['university']);
        }
        mysqli_close($link);
        return $student;
    }

    public function insertStudent($name, $age, $university)
    {
        $link = $this->getConnect();
        $sql = "INSERT INTO sinhvien (name, age, university) VALUES ('$name', '$age', '$university')";
        $res = mysqli_query($link, $sql);
        mysqli_close($link);
        return $res;
    }

    public function updateStudent($id, $name, $age, $university)
    {
        $link = $this->getConnect();
        $sql = "UPDATE sinhvien SET name = '$name', age = '$age', university = '$university' WHERE id = '$id'";
        $res = mysqli_query($link, $sql);
        mysqli_close($link);
        return $res;
    }

    public function deleteStudent($id)
    {
        $link = $this->getConnect();
        $sql = "DELETE FROM sinhvien WHERE id = '$id'";
        $res = mysqli_query($link, $sql);
        mysqli_close($link);
        return $res;
    }

    public function searchStudent($field, $value)
    {
        $link = $this->getConnect();
        $allowed = array('id', 'name', 'age', 'university');
        if (!in_array($field, $allowed)) {
            $field = 'name';
        }
        $sql = "SELECT * FROM sinhvien WHERE $field LIKE '%$value%'";
        $rs = mysqli_query($link, $sql);
        $students = array();
        $i = 1;
        while ($row = mysqli_fetch_array($rs)) {
            $students[$i++] = new Entity_Student($row['id'], $row['name'], $row['age'], $row['university']);
        }
        mysqli_close($link);
        return $students;
    }
}
?>
