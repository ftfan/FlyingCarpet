pragma solidity ^0.4.11;

contract NoteContract {
    mapping(address => string[]) public notes;
    event ModifyNote(address, uint index);

    constructor() public {
    }

    event NewNote(address, string note);

    // 添加记事
    function addNote( string memory note) public {
        notes[msg.sender].push(note);
        emit NewNote(msg.sender, note);
    }

    function modifyNote(address own, uint index, string memory note) public {
        notes[own][index] = note;
        emit ModifyNote(own, index);
    }

    function getNotesLen(address own) public view returns (uint) {
        return notes[own].length;
    }
}