// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint256 id;
        string name;
        uint256 age;
    }

    Student[] public students;

    event StudentAdded(uint256 id, string name, uint256 age);

    // Add a new student record
    function addStudent(uint256 _id, string memory _name, uint256 _age) public {
        Student memory newStudent = Student(_id, _name, _age);
        students.push(newStudent);
        emit StudentAdded(_id, _name, _age);
    }

    // Get the number of students in the array
    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    // Get student information by index
    function getStudent(uint256 index) public view returns (uint256, string memory, uint256) {
        require(index < students.length, "Student not found");
        Student memory student = students[index];
        return (student.id, student.name, student.age);
    }

    // Receive ether function (accept incoming Ether)
    receive() external payable {
        // Perform any necessary actions when receiving Ether
    }
}
