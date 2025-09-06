;; Title: OrangeChain Governance Protocol
;; Summary: Advanced multi-tiered governance and liquid staking protocol
;;          engineered for Bitcoin Layer-2 ecosystem with dynamic yield optimization
;; Description: OrangeChain revolutionizes DeFi governance by introducing a 
;;              sophisticated tiered participation system where STX holders can 
;;              stake tokens to earn ORANGE governance tokens, participate in 
;;              protocol decisions, and unlock progressive reward multipliers.
;;              Built with Bitcoin's security model at its core, featuring 
;;              time-locked staking mechanisms, democratic proposal systems,
;;              and tier-based privilege escalation for sustainable tokenomics.

;; TOKEN DEFINITIONS
(define-fungible-token ORANGE-TOKEN u0)

;; CONSTANTS & ERROR DEFINITIONS
(define-constant CONTRACT-OWNER tx-sender)

;; Error Constants - Comprehensive Error Handling System
(define-constant ERR-NOT-AUTHORIZED (err u1000))
(define-constant ERR-INVALID-PROTOCOL (err u1001))
(define-constant ERR-INVALID-AMOUNT (err u1002))
(define-constant ERR-INSUFFICIENT-STX (err u1003))
(define-constant ERR-COOLDOWN-ACTIVE (err u1004))
(define-constant ERR-NO-STAKE (err u1005))
(define-constant ERR-BELOW-MINIMUM (err u1006))
(define-constant ERR-PAUSED (err u1007))

;; STATE VARIABLES - Protocol Configuration
(define-data-var contract-paused bool false)
(define-data-var emergency-mode bool false)
(define-data-var stx-pool uint u0)
(define-data-var base-reward-rate uint u500) ;; 5% base rate (100 = 1%)
(define-data-var bonus-rate uint u100) ;; 1% bonus for longer staking
(define-data-var minimum-stake uint u1000000) ;; Minimum stake amount (1 STX)
(define-data-var cooldown-period uint u1440) ;; 24 hour cooldown in blocks
(define-data-var proposal-count uint u0)

;; DATA STRUCTURES - Core Protocol Maps

;; Governance Proposals Mapping - Democratic Decision Making
(define-map Proposals
  { proposal-id: uint }
  {
    creator: principal,
    description: (string-utf8 256),
    start-block: uint,
    end-block: uint,
    executed: bool,
    votes-for: uint,
    votes-against: uint,
    minimum-votes: uint,
  }
)

;; User Position Tracking - Comprehensive User State Management
(define-map UserPositions
  principal
  {
    total-collateral: uint,
    total-debt: uint,
    health-factor: uint,
    last-updated: uint,
    stx-staked: uint,
    orange-tokens: uint,
    voting-power: uint,
    tier-level: uint,
    rewards-multiplier: uint,
  }
)

;; Staking Position Management - Time-Locked Staking System
(define-map StakingPositions
  principal
  {
    amount: uint,
    start-block: uint,
    last-claim: uint,
    lock-period: uint,
    cooldown-start: (optional uint),
    accumulated-rewards: uint,
  }
)