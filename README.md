# OrangeChain Governance Protocol

![OrangeChain Logo](https://img.shields.io/badge/OrangeChain-v1.0.0-orange)
[![Stacks Version](https://img.shields.io/badge/Stacks-Clarity%203.0-blue)](https://docs.stacks.co/clarity)
[![License](https://img.shields.io/badge/License-ISC-green)](LICENSE)
[![Tests](https://img.shields.io/badge/Tests-Vitest-yellow)](tests/)

> **Advanced multi-tiered governance and liquid staking protocol engineered for Bitcoin Layer-2 ecosystem with dynamic yield optimization**

## 🌟 Overview

OrangeChain revolutionizes DeFi governance by introducing a sophisticated tiered participation system where STX holders can stake tokens to earn ORANGE governance tokens, participate in protocol decisions, and unlock progressive reward multipliers. Built with Bitcoin's security model at its core, featuring time-locked staking mechanisms, democratic proposal systems, and tier-based privilege escalation for sustainable tokenomics.

## 🏗️ Architecture

### Core Components

- **Multi-Tier Staking System**: Progressive reward multipliers based on stake amounts
- **Democratic Governance**: Community-driven proposal and voting system
- **Time-Lock Incentives**: Enhanced rewards for longer commitment periods
- **Security First**: Built-in cooldown periods and emergency controls
- **Yield Optimization**: Dynamic reward calculations with tier-based bonuses

## 🔧 Features

### 🏆 Tiered Membership System

| Tier | Minimum Stake | Reward Multiplier | Features |
|------|---------------|-------------------|----------|
| **Bronze** | 1 STX | 1.0x | Basic staking & voting |
| **Gold** | 5 STX | 1.5x | Enhanced rewards + advanced features |
| **Platinum** | 10 STX | 2.0x | Maximum rewards + premium features |

### 🔒 Staking Mechanisms

- **Flexible Staking**: No lock period with base rewards
- **Time-Locked Staking**:
  - 1 Month: 1.25x multiplier
  - 2 Months: 1.5x multiplier
- **Security Cooldown**: 24-hour withdrawal protection

### 🗳️ Governance System

- **Proposal Creation**: Community-driven protocol improvements
- **Weighted Voting**: Vote power proportional to staked amount
- **Democratic Process**: Transparent voting with configurable periods

## 🚀 Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) v2.0+
- [Node.js](https://nodejs.org/) v18+
- [Stacks CLI](https://docs.stacks.co/build/cli)

### Installation

```bash
# Clone the repository
git clone https://github.com/your-org/orange-chain.git
cd orange-chain

# Install dependencies
npm install

# Initialize Clarinet project
clarinet check
```

### Testing

```bash
# Run all tests
npm test

# Run tests with coverage
npm run test:report

# Watch mode for development
npm run test:watch

# Check contracts syntax
clarinet check
```

## 📋 Contract Interface

### Public Functions

#### Staking Operations

```clarity
;; Stake STX with optional time-lock
(stake-stx (amount uint) (lock-period uint))

;; Begin unstaking process
(initiate-unstake (amount uint))

;; Complete unstaking after cooldown
(complete-unstake)
```

#### Governance Operations

```clarity
;; Create a governance proposal
(create-proposal (description (string-utf8 256)) (voting-period uint))

;; Vote on active proposals
(vote-on-proposal (proposal-id uint) (vote-for bool))
```

#### Administrative Functions

```clarity
;; Initialize contract (owner only)
(initialize-contract)

;; Emergency pause/resume
(pause-contract)
(resume-contract)
```

### Read-Only Functions

```clarity
;; User information queries
(get-user-position (user principal))
(get-staking-position (user principal))

;; Protocol state queries
(get-stx-pool)
(get-proposal-count)
(get-proposal (proposal-id uint))
(get-tier-info-by-level (tier-level uint))
(get-reward-rates)
(is-contract-paused)
```

## 💡 Usage Examples

### Basic Staking

```clarity
;; Stake 5 STX without time-lock
(contract-call? .orange-chain stake-stx u5000000 u0)

;; Stake 10 STX with 1-month lock for bonus rewards
(contract-call? .orange-chain stake-stx u10000000 u4320)
```

### Governance Participation

```clarity
;; Create a governance proposal
(contract-call? .orange-chain create-proposal 
  u"Increase base reward rate to 6%" 
  u1440)  ;; 10-day voting period

;; Vote on proposal #1
(contract-call? .orange-chain vote-on-proposal u1 true)
```

### Unstaking Process

```clarity
;; Initiate unstaking (starts cooldown)
(contract-call? .orange-chain initiate-unstake u5000000)

;; Complete unstaking (after 24 hours)
(contract-call? .orange-chain complete-unstake)
```

## 🔍 Error Codes

| Code | Description |
|------|-------------|
| `u1000` | Not authorized |
| `u1001` | Invalid protocol parameter |
| `u1002` | Invalid amount |
| `u1003` | Insufficient STX balance |
| `u1004` | Cooldown period active |
| `u1005` | No active stake found |
| `u1006` | Below minimum stake |
| `u1007` | Contract paused |

## 🛡️ Security Features

### Built-in Protections

- **Cooldown Periods**: 24-hour delay for unstaking
- **Emergency Pause**: Contract-wide pause capability
- **Input Validation**: Comprehensive parameter checking
- **Access Controls**: Owner-only administrative functions
- **Reentrancy Protection**: Safe state management

### Audit Considerations

- All state changes are atomic
- No external dependencies
- Clear separation of concerns
- Comprehensive error handling
- Gas-efficient operations

## 🔬 Testing

The protocol includes comprehensive test coverage:

```bash
# Location: tests/orange-chain.test.ts
- Staking mechanism validation
- Governance proposal lifecycle
- Tier system functionality
- Security feature testing
- Edge case handling
```

## 📊 Protocol Parameters

| Parameter | Value | Description |
|-----------|-------|-------------|
| Base Reward Rate | 5% | Annual staking rewards |
| Bonus Rate | 1% | Additional rate for long-term staking |
| Minimum Stake | 1 STX | Entry barrier for participation |
| Cooldown Period | 24 hours | Security delay for unstaking |
| Max Proposal Description | 256 chars | Governance proposal limit |

## 🛣️ Roadmap

### Phase 1 (Current)

- [x] Core staking mechanics
- [x] Tiered reward system
- [x] Basic governance
- [x] Security features

### Phase 2 (Planned)

- [ ] ORANGE token integration
- [ ] Advanced governance features
- [ ] Cross-chain compatibility
- [ ] Yield farming strategies

### Phase 3 (Future)

- [ ] DAO treasury management
- [ ] Protocol-owned liquidity
- [ ] Advanced analytics
- [ ] Mobile integration

## 🤝 Contributing

We welcome contributions from the community! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Development Workflow

1. Fork the repository
2. Create a feature branch
3. Implement changes with tests
4. Run the test suite
5. Submit a pull request

## 📄 License

This project is licensed under the ISC License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [Stacks Documentation](https://docs.stacks.co/)
- [Clarity Language Reference](https://book.clarity-lang.org/)
- [Clarinet Testing Framework](https://github.com/hirosystems/clarinet)
- [Bitcoin Layer-2 Ecosystem](https://www.stacks.co/)
