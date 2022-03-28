(deffacts datos
    (palet naranjas 6 manzanas 5 caquis 4 uva 8)
    (pedido naranjas 5 manzanas 2 caquis 1 uva 3)
    (linea naranjas 0 manzanas 0 caquis 0 uva 0)
    (maxCajasEncima 3)
)

;; (Maxima prioridad) Compruebo que hay mas productos en el palet
;; que en el pedido si no es asi no se puede seguir con el problema
(defrule acabarPartidaErr
( declare (salience 99))
(palet naranjas ?naranjasPa manzanas ?manzanasPa caquis ?caquisPa uva ?uvaPa)
(pedido naranjas ?naranjasPe manzanas ?manzanasPe caquis ?caquisPe uva ?uvaPe)
(test (< ?naranjasPa ?naranjasPe))
(test (< ?manzanasPa ?manzanasPe))
(test (< ?caquisPa ?caquisPe))
(test (< ?uvaPa ?uvaPe))
=>
(printout t "No hay stock suficiente para ese pedido" crlf)
(halt))

(defrule cogerCajasDeNaranjas
?fP <- (pedido naranjas ?x $?misc)
?fL <- (linea naranjas ?xLinea $?miscLinea)
(test (> ?x ?xLinea))
=>
(retract ?fL)
(assert (linea naranjas (+ ?xLinea 1) $?miscLinea))
)

(defrule cogerCajasDeManzanas
?fP <- (pedido naranjas ?x $?misc)
?fL <- (linea naranjas ?xLinea $?miscLinea)
(test (> ?x ?xLinea))
=>
(retract ?fL)
(assert (linea naranjas (+ ?xLinea 1) $?miscLinea))
)

(defrule cogerCajasDeCaquis
?fP <- (pedido naranjas ?x $?misc)
?fL <- (linea naranjas ?xLinea $?miscLinea)
(test (> ?x ?xLinea))
=>
(retract ?fL)
(assert (linea naranjas (+ ?xLinea 1) $?miscLinea))
)

(defrule cogerCajasDeUva
?fP <- (pedido naranjas ?x $?misc)
?fL <- (linea naranjas ?xLinea $?miscLinea)
(test (> ?x ?xLinea))
=>
(retract ?fL)
(assert (linea naranjas (+ ?xLinea 1) $?miscLinea))
)