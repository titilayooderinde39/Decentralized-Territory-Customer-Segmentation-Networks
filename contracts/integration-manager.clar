;; Integration Manager Contract
;; Handles cross-contract interactions after all contracts are deployed

;; Constants
(define-constant ERR_UNAUTHORIZED (err u600))
(define-constant ERR_NOT_FOUND (err u601))
(define-constant ERR_INVALID_INPUT (err u602))

;; Contract references (set these after deployment)
(define-data-var analyst-contract (optional principal) none)
(define-data-var customer-contract (optional principal) none)
(define-data-var segment-contract (optional principal) none)
(define-data-var strategy-contract (optional principal) none)
(define-data-var performance-contract (optional principal) none)

;; Admin functions to set contract references
(define-public (set-analyst-contract (contract-address principal))
  (begin
    (var-set analyst-contract (some contract-address))
    (ok true)
  )
)

(define-public (set-customer-contract (contract-address principal))
  (begin
    (var-set customer-contract (some contract-address))
    (ok true)
  )
)

(define-public (set-segment-contract (contract-address principal))
  (begin
    (var-set segment-contract (some contract-address))
    (ok true)
  )
)

(define-public (set-strategy-contract (contract-address principal))
  (begin
    (var-set strategy-contract (some contract-address))
    (ok true)
  )
)

(define-public (set-performance-contract (contract-address principal))
  (begin
    (var-set performance-contract (some contract-address))
    (ok true)
  )
)

;; Integrated workflow functions
(define-public (create-full-workflow (analyst-name (string-ascii 50)) (credentials (string-ascii 200)))
  (let ((caller tx-sender))
    ;; This function can orchestrate cross-contract calls once all contracts are deployed
    ;; For now, just return success
    (ok true)
  )
)

;; Read-only functions to get contract addresses
(define-read-only (get-analyst-contract)
  (var-get analyst-contract)
)

(define-read-only (get-customer-contract)
  (var-get customer-contract)
)

(define-read-only (get-segment-contract)
  (var-get segment-contract)
)

(define-read-only (get-strategy-contract)
  (var-get strategy-contract)
)

(define-read-only (get-performance-contract)
  (var-get performance-contract)
)
