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

;; Termina el pedido con exito
(defrule acabarPartidaSuccess
( declare (salience 90))
(linea naranjas ?naranjasL manzanas ?manzanasL caquis ?caquisL uva ?uvaL)
(pedido naranjas ?naranjasPe manzanas ?manzanasPe caquis ?caquisPe uva ?uvaPe)
(test (= ?naranjasL ?naranjasPe))
(test (= ?manzanasL ?manzanasPe))
(test (= ?caquisL ?caquisPe))
(test (= ?uvaL ?uvaPe))
=>
(printout t "Pedido finalizado con exito" crlf)
(halt))

(defrule cogerCajasDeNaranjasMultiples
( declare (salience 10))
?fP <- (pedido naranjas ?x $?misc)
?fL <- (linea naranjas ?xLinea $?miscLinea)
(maxCajasEncima ?cajasMax)
(test (> ?x ?xLinea));; no hay mas de
(test (> 1 ?x));; hay mas de 1 caja apuntada en el pedido
(test (+ ?x ?cajasMax))

=>
(retract ?fL)
(assert (linea naranjas (+ ?xLinea 1) $?miscLinea))
)

(defrule cogerCajasDeNaranjas
?fP <- (pedido naranjas ?x $?misc)
?fL <- (linea naranjas ?xLinea $?miscLinea)
(test (> ?x ?xLinea))
=>
(retract ?fL)
(assert (linea naranjas (+ ?xLinea 1) $?miscLinea))
)

(defrule cogerCajasDeManzanas
?fP <- (pedido $?iniMisc manzanas ?x $?misc)
?fL <- (linea $?iniMiscLinea manzanas ?xLinea $?miscLinea)
(test (> ?x ?xLinea))
=>
(retract ?fL)
(assert (linea $?iniMiscLinea manzanas (+ ?xLinea 1) $?miscLinea))
)

(defrule cogerCajasDeCaquis
?fP <- (pedido $?iniMisc caquis ?x $?misc)
?fL <- (linea $?iniMiscLinea caquis ?xLinea $?miscLinea)
(test (> ?x ?xLinea))
=>
(retract ?fL)
(assert (linea $?iniMiscLinea caquis (+ ?xLinea 1) $?miscLinea))
)

(defrule cogerCajasDeUva
?fP <- (pedido $?iniMisc uva ?x $?misc)
?fL <- (linea $?iniMiscLinea uva ?xLinea $?miscLinea)
(test (> ?x ?xLinea))
=>
(retract ?fL)
(assert (linea $?iniMiscLinea uva (+ ?xLinea 1) $?miscLinea))
)