pragma solidity ^0.4.15;

import "./AgentRegistryInterface.sol";

contract AgentRegistry is AgentRegistryInterface {

    struct Service {
        uint unit;
        uint pricePerUnit;
    }

    address[] public agents;

    mapping (uint => Service[]) services;

    mapping (uint => address[]) agentsForService;

    function getAgentsWithService(uint service) external constant returns (address[]) {
        return agentsForService[service];
    }

    // function getAgent(uint id) external constant returns (address) {
    //     return agents[id];
    // }

    function addAgent(uint service, uint unit, uint price, address agent) external {
        // require(services[service].unit == 0 && services[service].pricePerUnit == 0);
        services[service].push(Service(unit, price));

        agents.push(agent);
        agentsForService[service].push(agent);

        AgentAdded(agent, service);
    }
}
