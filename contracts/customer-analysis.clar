;; Customer Analysis Contract
;; Handles customer data analysis and storage for territories

;; Constants
(define-constant ERR_UNAUTHORIZED (err u200))
(define-constant ERR_NOT_FOUND (err u201))
(define-constant ERR_INVALID_INPUT (err u202))
(define-constant ERR_ANALYST_NOT_VERIFIED (err u203))

;; Data Variables
(define-data-var next-customer-id uint u1)

;; Data Maps
(define-map customers
  { customer-id: uint }
  {
    territory-id: uint,
    data: (string-ascii 500),
    value-score: uint,
    analyst-id: uint,
    analysis-block: uint
  }
)

(define-map territory-customers
  { territory-id: uint, customer-id: uint }
  { active: bool }
)

;; Public Functions

;; Add customer analysis data
(define-public (add-customer (territory-id uint) (data (string-ascii 500)) (value-score uint))
  (let ((customer-id (var-get next-customer-id))
        (caller tx-sender))
    (asserts! (> (len data) u0) ERR_INVALID_INPUT)
    (asserts! (> territory-id u0) ERR_INVALID_INPUT)

    ;; For now, allow any caller - can be restricted later
    (map-set customers
      { customer-id: customer-id }
      {
        territory-id: territory-id,
        data: data,
        value-score: value-score,
        analyst-id: u1, ;; Default analyst ID
        analysis-block: block-height
      }
    )

    (map-set territory-customers
      { territory-id: territory-id, customer-id: customer-id }
      { active: true }
    )

    (var-set next-customer-id (+ customer-id u1))
    (ok customer-id)
  )
)

;; Update customer data
(define-public (update-customer (customer-id uint) (data (string-ascii 500)) (value-score uint))
  (let ((caller tx-sender))
    (asserts! (> (len data) u0) ERR_INVALID_INPUT)

    (match (map-get? customers { customer-id: customer-id })
      customer-data
      (begin
        (map-set customers
          { customer-id: customer-id }
          (merge customer-data {
            data: data,
            value-score: value-score,
            analyst-id: u1, ;; Default analyst ID
            analysis-block: block-height
          })
        )
        (ok true)
      )
      ERR_NOT_FOUND
    )
  )
)

;; Read-only Functions

;; Get customer data
(define-read-only (get-customer (customer-id uint))
  (map-get? customers { customer-id: customer-id })
)

;; Check if customer exists in territory
(define-read-only (is-customer-in-territory (territory-id uint) (customer-id uint))
  (match (map-get? territory-customers { territory-id: territory-id, customer-id: customer-id })
    territory-customer (get active territory-customer)
    false
  )
)

;; Get next customer ID
(define-read-only (get-next-customer-id)
  (var-get next-customer-id)
)
