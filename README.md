# Decentralized Territory Customer Segmentation Networks

A blockchain-based system for managing territory customer segmentation analysis using Clarity smart contracts on the Stacks blockchain.

## System Architecture

The system consists of five interconnected smart contracts:

### 1. Segmentation Analyst Verification (`segmentation-analyst-verification.clar`)
Manages the registration and verification of territory segmentation analysts.

**Key Features:**
- Analyst registration with credentials
- Verification status management
- Authority delegation system

### 2. Customer Analysis (`customer-analysis.clar`)
Handles customer data analysis and storage for territories.

**Key Features:**
- Customer profile management
- Territory assignment
- Analysis data storage

### 3. Segment Identification (`segment-identification.clar`)
Identifies and categorizes customer segments based on analysis data.

**Key Features:**
- Automated segment classification
- Custom segment creation
- Segment criteria management

### 4. Strategy Development (`strategy-development.clar`)
Develops and manages strategies for different customer segments.

**Key Features:**
- Strategy creation and approval
- Segment-specific strategy assignment
- Strategy effectiveness tracking

### 5. Performance Tracking (`performance-tracking.clar`)
Tracks and reports on segment performance metrics.

**Key Features:**
- Performance metrics collection
- Reporting and analytics
- Historical performance tracking

## Getting Started

### Prerequisites
- Stacks blockchain node
- Clarity CLI tools
- Node.js and npm for testing

### Installation
1. Clone the repository
2. Install dependencies: `npm install`
3. Run tests: `npm test`

### Contract Deployment
Deploy contracts in the specified order to ensure proper dependencies.

## Usage Examples

### Register an Analyst
\`\`\`clarity
(contract-call? .segmentation-analyst-verification register-analyst "analyst-name" "credentials")
\`\`\`

### Add Customer Data
\`\`\`clarity
(contract-call? .customer-analysis add-customer u1 "customer-data" u100)
\`\`\`

### Create Segment
\`\`\`clarity
(contract-call? .segment-identification create-segment "segment-name" "criteria")
\`\`\`

## Testing

The project uses Vitest for testing. Run tests with:

\`\`\`bash
npm test
\`\`\`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

MIT License - see LICENSE file for details.
\`\`\`
