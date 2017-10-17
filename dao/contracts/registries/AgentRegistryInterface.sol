pragma solidity ^0.4.15;

contract AgentRegistryInterface {

    event AgentAdded(address agent, uint service);

    function getAgentsWithService(uint service) external constant returns (address[]);
    // function getAgent(uint id) external constant returns (address);
    function addAgent(uint service, uint unit, uint price, address agent) external;

}
