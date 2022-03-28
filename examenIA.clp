(deffacts datos
    (palet naranjas 6 manzanas 5 caquis 4 uva 8)
    (pedido naranjas 5 manzanas 2 caquis 1 uva 3)
    (maxCajasEncima 3)
)

;; (Maxima prioridad) Antes de empezar compruebo que hay mas productos 
;; en el pale que en el pedido si no es asi no se puede seguir con el problema
(defrule acabarPartidaErr
( declare (salience 99))
(palet naranjas ?naranjasPa manzanas ?manzanasPa caquis ?caquisPa uva ?uvasPa)
(pedido naranjas ?naranjasPe manzanas ?manzanasPe caquis ?caquisPe uva ?uvasPe)
(test (>= ?naranjasPa ?naranjasPe))
(test (>= ?manzanasPa ?manzanasPe))
(test (>= ?caquisPa ?caquisPe))
(test (>= ?uvaPa ?uvaPe))
=>
(printout t "No hay stock suficiente para ese pedido" crlf)
(halt))

(defrule cogerCajasDeNaranjas
(pedido ?x)
(num ?y)
=>
(assert (numMult (* ?x ?y)))
)

 1) movimientos (+ ?m 1) $?caja)))