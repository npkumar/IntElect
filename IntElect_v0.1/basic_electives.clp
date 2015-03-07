;;;======================================================
;;; 	Basic Electives Expert System
;;;
;;;     This expert system suggests some electives
;;;     that you may wish you take up for your M.Tech
;;;		course.
;;;
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate student
	(slot fulltime)
)

(deftemplate elective
    (slot code)       ;; ELECTIVE CODE
    (multislot name)  ;; NAME
    (slot stream (type SYMBOL) (allowed-symbols KE SE))     ;; KE/SE
    (slot setf)       ;; ONE TO EIGHT
    (slot setp)       ;; ONE TO FOUR
    (slot type)       ;; TECHNICAL/MANAGEMENT
    (slot prg)        ;; INVOLVES PGMING
    (slot mode)       ;; ONLINE/CLASSROOM/ONLINE_SUPPORT
    (multislot preq)       ;; 
    (slot cf (type FLOAT) (default 0.5))     
)


(deftemplate elective_goal
    (slot code)       ;; ELECTIVE CODE
    (multislot name)  ;; NAME
    (slot stream (type SYMBOL) (allowed-symbols KE SE))     ;; KE/SE
    (slot setf)       ;; ONE TO EIGHT
    (slot setp)       ;; ONE TO FOUR
    (slot type)       ;; TECHNICAL/MANAGEMENT
    (slot prg)        ;; INVOLVES PGMING
    (slot mode)       ;; ONLINE/CLASSROOM/ONLINE_SUPPORT
    (multislot preq)       ;; 
    (slot cf (type FLOAT) (default 0.5))     
)


(deftemplate elective_wgoal
    (slot code)       ;; ELECTIVE CODE
    (multislot name)  ;; NAME
    (slot stream (type SYMBOL) (allowed-symbols KE SE))     ;; KE/SE
    (slot setf)       ;; ONE TO EIGHT
    (slot setp)       ;; ONE TO FOUR
    (slot type)       ;; TECHNICAL/MANAGEMENT
    (slot prg)        ;; INVOLVES PGMING
    (slot mode)       ;; ONLINE/CLASSROOM/ONLINE_SUPPORT
    (multislot preq)       ;; 
    (slot cf (type FLOAT))     
)

(deffacts load_electives
    ;; CBR 
    (elective 
        (code CBR) 
        (name CASE BASED REASONING) 
        (stream KE) 
        (setf FOUR) 
        (setp TWO) 
        (type KE/BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Business Analytics (previously Data Mining) 
    (elective 
        (code BADM) 
        (name BUSINESS ANALYTICS) 
        (stream KE) 
        (setf SEVEN) 
        (setp THREE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Knowledge Management 
    (elective 
        (code KM) 
        (name KNOWLEDGE MANAGEMENT) 
        (stream KE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Genetic Algorithms
    (elective 
        (code GA) 
        (name GENETIC ALGORITHMS) 
        (stream KE) 
        (setf THREE) 
        (setp ONE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Text Mining
    (elective 
        (code TM) 
        (name TEXT MINING) 
        (stream KE) 
        (setf FIVE) 
        (setp THREE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Human Computer Interface
    (elective 
        (code HCI) 
        (name HUMAN COMPUTER INTERFACE) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type TECHNICAL/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Mobile Wireless Application Development
    (elective 
        (code MWAD) 
        (name MOBILE WIRELESS APPLICATION DEVELOPMENT) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OBJECTIVE-C)
    )

    ;; Information Systems Security
    (elective 
        (code ISS) 
        (name INFORMATION SYSTEMS SECURITY) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type TECHNICAL/MANAGEMENT/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )

   ;; Architecting Software Solutions
    (elective 
        (code ASWS) 
        (name ARCHITECTING SOFTWARE SOLUTIONS) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type TECHNICAL/MANAGEMENT) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING AND DESIGN)
    )

    ;; Enterprise .NET II
    (elective 
        (code ENETTWO) 
        (name ENTERPRISE .NET II) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq COURSE NETONE)
    )

    ;; Open Source for the Enterprise
    (elective 
        (code OSE) 
        (name OPEN SOURCE FOR THE ENTERPRISE) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type TECHNICAL/MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Service Innovation
    (elective 
        (code SI) 
        (name SERVICE INNOVATION) 
        (stream SE) 
        (setf FIVE) 
        (setp THREE) 
        (type MANAGEMENT/BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Software Maintenance and Evolution
    (elective 
        (code SWME) 
        (name SOFTWARE MAINTENANCE AND EVOLUTION) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )

    ;; Software Prototyping
    (elective 
        (code SWP) 
        (name SOFTWARE PROTOTYPING) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )

    ;; Agile Software Project Management
    (elective 
        (code ASPM) 
        (name AGILE SOFTWARE PROJECT MANAGEMENT) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type MANAGEMENT/TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Research on Advanced IT Topics I
    (elective 
        (code RAITONE) 
        (name RESEARCH ON ADVANCED IT TOPICS I) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type RESEARCH) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq KE PROPOSAL FOR KE/ONLY CASE STUDY FOR FT)
    )

    ;; Research on Advanced IT Topics II
    (elective 
        (code RAITTWO) 
        (name RESEARCH ON ADVANCED IT TOPICS II) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type RESEARCH) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq COURSE SG 5220)
    )

    ;; Enterprise integration 
    (elective 
        (code EI) 
        (name ENTERPRISE INTEGRATION) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Dot NET 1 
    (elective 
        (code ENETONE) 
        (name ENTERPRISE .NET I) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )
   ;; Cloud Computing 
    (elective 
        (code CC) 
        (name CLOUD COMPUTING) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq JAVA)
    )
   ;; Software Metrics & process improvement
    (elective 
        (code SMPI) 
        (name SOFTWARE METRICS AND PROCESS IMPROVEMENT) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Managing IT Outsourcing and subcontracting 
    (elective 
        (code MITOS) 
        (name MANAGING IT OUTSOURCING AND SUBCONTRACTING)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode ONLINE) 
        (preq NONE)
    )
   ;; OODP 
    (elective 
        (code OODP) 
        (name OBJECT ORIENTED DESIGN PATTERNS) 
        (stream SE) 
        (setf FIVE) 
        (setp THREE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )
   ;; Java 
    (elective 
        (code EJ) 
        (name ENTERPRISE JAVA) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq JAVA)
    )
   ;; BPM
    (elective 
        (code BPM) 
        (name BUSINESS PROCESS MANAGEMENT) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Software Requirements Engg 
    (elective 
        (code SWRE) 
        (name SOFTWARE REQUIREMENTS ENGINEERING) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; IT Law
    (elective 
        (code ITL) 
        (name IT LAW) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; IT Service Management 
    (elective 
        (code ITSM) 
        (name IT SERVICE MANAGEMENT) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

)

;;;;;;;;;;;;;; FACTS FOR GOALS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffacts load_elective_goals
    ;; CBR 
    (elective_goal 
        (code CBR) 
        (name CASE BASED REASONING) 
        (stream KE) 
        (setf FOUR) 
        (setp TWO) 
        (type KE/BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Business Analytics (previously Data Mining) 
    (elective_goal 
        (code BADM) 
        (name BUSINESS ANALYTICS) 
        (stream KE) 
        (setf SEVEN) 
        (setp THREE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Knowledge Management 
    (elective_goal 
        (code KM) 
        (name KNOWLEDGE MANAGEMENT) 
        (stream KE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Genetic Algorithms
    (elective_goal 
        (code GA) 
        (name GENETIC ALGORITHMS) 
        (stream KE) 
        (setf THREE) 
        (setp ONE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Text Mining
    (elective_goal 
        (code TM) 
        (name TEXT MINING) 
        (stream KE) 
        (setf FIVE) 
        (setp THREE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Human Computer Interface
    (elective_goal 
        (code HCI) 
        (name HUMAN COMPUTER INTERFACE) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type TECHNICAL/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Mobile Wireless Application Development
    (elective_goal 
        (code MWAD) 
        (name MOBILE WIRELESS APPLICATION DEVELOPMENT) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OBJECTIVE-C)
    )

    ;; Information Systems Security
    (elective_goal 
        (code ISS) 
        (name INFORMATION SYSTEMS SECURITY) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type TECHNICAL/MANAGEMENT/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )

   ;; Architecting Software Solutions
    (elective_goal 
        (code ASWS) 
        (name ARCHITECTING SOFTWARE SOLUTIONS) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type TECHNICAL/MANAGEMENT) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING AND DESIGN)
    )

    ;; Enterprise .NET II
    (elective_goal 
        (code ENETTWO) 
        (name ENTERPRISE .NET II) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq COURSE NETONE)
    )

    ;; Open Source for the Enterprise
    (elective_goal 
        (code OSE) 
        (name OPEN SOURCE FOR THE ENTERPRISE) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type TECHNICAL/MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Service Innovation
    (elective_goal 
        (code SI) 
        (name SERVICE INNOVATION) 
        (stream SE) 
        (setf FIVE) 
        (setp THREE) 
        (type MANAGEMENT/BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Software Maintenance and Evolution
    (elective_goal 
        (code SWME) 
        (name SOFTWARE MAINTENANCE AND EVOLUTION) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )

    ;; Software Prototyping
    (elective_goal 
        (code SWP) 
        (name SOFTWARE PROTOTYPING) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )

    ;; Agile Software Project Management
    (elective_goal 
        (code ASPM) 
        (name AGILE SOFTWARE PROJECT MANAGEMENT) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type MANAGEMENT/TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Research on Advanced IT Topics I
    (elective_goal 
        (code RAITONE) 
        (name RESEARCH ON ADVANCED IT TOPICS I) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type RESEARCH) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq KE PROPOSAL FOR KE/ONLY CASE STUDY FOR FT)
    )

    ;; Research on Advanced IT Topics II
    (elective_goal 
        (code RAITTWO) 
        (name RESEARCH ON ADVANCED IT TOPICS II) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type RESEARCH) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq COURSE SG 5220)
    )

    ;; Enterprise integration 
    (elective_goal 
        (code EI) 
        (name ENTERPRISE INTEGRATION) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Dot NET 1 
    (elective_goal 
        (code ENETONE) 
        (name ENTERPRISE .NET I) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )
   ;; Cloud Computing 
    (elective_goal 
        (code CC) 
        (name CLOUD COMPUTING) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq JAVA)
    )
   ;; Software Metrics & process improvement
    (elective_goal 
        (code SMPI) 
        (name SOFTWARE METRICS AND PROCESS IMPROVEMENT) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Managing IT Outsourcing and subcontracting 
    (elective_goal 
        (code MITOS) 
        (name MANAGING IT OUTSORCING AND SUBCONTRACTING) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode ONLINE) 
        (preq NONE)
    )
   ;; OODP 
    (elective_goal 
        (code OODP) 
        (name OBJECT ORIENTED DESIGN PATTERNS) 
        (stream SE) 
        (setf FIVE) 
        (setp THREE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )
   ;; Java 
    (elective_goal 
        (code EJ) 
        (name ENTERPRISE JAVA) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq JAVA)
    )
   ;; BPM
    (elective_goal 
        (code BPM) 
        (name BUSINESS PROCESS MANAGEMENT) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Software Requirements Engg 
    (elective_goal 
        (code SWRE) 
        (name SOFTWARE REQUIREMENTS ENGINEERING) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; IT Law
    (elective_goal 
        (code ITL) 
        (name IT LAW) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; IT Service Management 
    (elective_goal 
        (code ITSM) 
        (name IT SERVICE MANAGEMENT) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

)

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list)
)

;;;****************
;;;* GLOBAL VARS  *
;;;****************

(defglobal
	
    ?*FONE* = 0
    ?*FTWO* = 0
    ?*FTHREE* = 0
    ?*FFOUR* = 0
    ?*FFIVE* = 0
    ?*FSIX* = 0
    ?*FSEVEN* = 0
    ?*FEIGHT* = 0

    ?*PONE* = 0
    ?*PTWO* = 0
    ?*PTHREE* = 0
    ?*PFOUR* = 0
    ?*PFIVE* = 0
    ?*PSIX* = 0
    ?*PSEVEN* = 0
    ?*PEIGHT* = 0

    ?*PONESUB* = "NONE"
    ?*PTWOSUB* = "NONE"
    ?*PTHREESUB* = "NONE"
    ?*PFOURSUB* = "NONE"
    ?*PFIVESUB* = "NONE"
    ?*PSIXSUB* = "NONE"
    ?*PSEVENSUB* = "NONE"
    ?*PEIGHTSUB* = "NONE"

)

;;;********************
;;;* CF COMBINATIONS  *
;;;********************

;combine POSITIVE certainty factors for multiple conclusions
;cf(cf1,cf2) = cf1 + cf2 * (1- cf1)

(defrule combine_positive_cf
  ?f1 <- (elective_goal (code ?c)(cf ?cf1&:(>= ?cf1 0)))
  ?f2 <- (elective_wgoal (code ?c)(cf ?cf2&:(>= ?cf2 0)))
  (test (neq ?f1 ?f2)) ; test pointers and not value
  =>
  (retract ?f2)
  (modify ?f1 (cf =(+ ?cf1 (* ?cf2 (- 1 ?cf1)))))
)


;combine NEGATIVE cf
;cf(cf1,cf2) = cf1 + cf2 * (1 + cf1)

(defrule combine_negative_cf
 (declare (salience -1))
  ?f1 <- (elective_goal   (code ?c)(cf ?cf1&:(<= ?cf1 0)))
  ?f2 <- (elective_wgoal (code ?c)(cf ?cf2&:(<= ?cf2 0)))
  (test (neq ?f1 ?f2))
  =>
  (retract ?f2)
  (modify ?f1 (cf =(+ ?cf1 (* ?cf2 (+ 1 ?cf1)))))
)

;combine one POSITIVE and one NEGATIVE
;cf(cf1,cf2) = (cf1 + cf2) / 1 - MIN[abs(cf1),abs(cf2)]

(defrule negative_positive_cf
 (declare (salience -1))
  ?f1 <- (elective_goal (code ?c) (cf ?cf1))
  ?f2 <- (elective_wgoal (code ?c) (cf ?cf2))
  (test (neq ?f1 ?f2))
  (test (< (* ?cf1 ?cf2) 0))
  =>
  (retract ?f2)
  (modify ?f1 (cf =(/ (+ ?cf1 ?cf2) (- 1 (min (abs ?cf1) (abs ?cf2))))))
)

;;;****************
;;;* STARTUP RULE *
;;;* RULE G01     *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;* RULE G02    *
;;;***************

(defrule determine_student_type 

   (logical (start))

   =>

   (assert (UI-state (display type)
                     (relation-asserted fulltime)
                     (response Yes)
                     (valid-answers Yes No))))


(defrule student_fulltime
	(logical (fulltime Yes))
	=>
	(assert (student (fulltime Yes)))
)

(defrule student_parttime
	(logical (fulltime No))
	=>
	(assert (student (fulltime No)))
)

;;;****************
;;;* BRANCH       *
;;;* RULE G03     *
;;;****************

(defrule determine_student_branch 

   (logical (or (fulltime Yes) (fulltime No)))

   =>
   

   (assert (UI-state (display branch)
                     (relation-asserted branch)
                     (response KE)
                     (valid-answers KE SE))))


;;KE specific rule based on prev rules!
(defrule ke_special

	(logical (branch KE))
	(elective (code CBR) (cf ?cf1))
	(elective (code BADM) (cf ?cf2))
	(elective (code KM) (cf ?cf3))
	(elective (code GA) (cf ?cf4))
	(elective (code TM) (cf ?cf5))
	=>
		;; Give weightage to all KE related subjects.
		(assert (elective_wgoal (code CBR) (cf (* ?cf1 1.0))))
		(assert (elective_wgoal (code BADM) (cf (* ?cf2 1.0))))
		(assert (elective_wgoal (code KM) (cf (* ?cf3 1.0))))
		(assert (elective_wgoal (code GA) (cf (* ?cf4 1.0))))
		(assert (elective_wgoal (code TM) (cf (* ?cf5 1.0))))

)

;;;****************
;;;* WORK         *
;;;* RULE G04     *
;;;****************

(defrule determine_student_has_worked

   (logical (or (branch KE) (branch SE)))

   =>

   (assert (UI-state (display worked)
                     (relation-asserted worked)
                     (response Yes)
                     (valid-answers Yes No))))

;;;****************
;;;* WORK EXP     *
;;;* RULE G05     *
;;;****************   

(defrule determine_student_experience

   (logical (worked Yes))

   =>

   (assert (UI-state (display experience)
                     (relation-asserted experience)
                     (response Medium)
                     (valid-answers High Medium Low))))


;;;***************
;;;* MANAGEMENT Q*
;;;* RULE M01    *
;;;***************


;; Management Experience

(defrule determine_student_management_experience

	(logical ( and (or (branch KE) (branch SE)) 
	               (or (experience High) (experience Medium) (experience Low)) ))

=>

	(assert (UI-state (display management_exp)
	(relation-asserted management_exp)
	(response No)
	(valid-answers Yes No)))

)

;;;* RULE ME1    *

(defrule student_management_exp_weightage_yes 
;; Subjects that will benefit from management experience
;; Using only 0.6 because prior experience is not a huge factor

	(logical (management_exp Yes))
	
	(elective (code ITSM) (cf ?cf1))
	(elective (code BPM) (cf ?cf2)) 
	(elective (code ASPM) (cf ?cf3))
	(elective (code ITL) (cf ?cf4))
	(elective (code KM) (cf ?cf5))
	(elective (code MITOS) (cf ?cf6))

	=>
	
	(assert (elective_wgoal (code ITSM) (cf (* ?cf1 0.8))))
	(assert (elective_wgoal (code BPM) (cf (* ?cf2 0.6))))
	(assert (elective_wgoal (code ASPM) (cf (* ?cf3 0.6))))
	(assert (elective_wgoal (code ITL) (cf (* ?cf4 0.6))))
	(assert (elective_wgoal (code KM) (cf (* ?cf5 0.6))))
	(assert (elective_wgoal (code MITOS) (cf (* ?cf6 0.6))))
)

;;;* RULE ME2    *

(defrule student_management_exp_weightage_no 
;; Subjects that might be tough or not-so-relevant w/o mgmt exp

	(logical (management_exp No))
	
	(elective (code ITSM) (cf ?cf1))
	(elective (code ASPM) (cf ?cf2))
	(elective (code MITOS) (cf ?cf3))

=>

	(assert (elective_wgoal (code ITSM) (cf (* ?cf1 -0.1))))
	(assert (elective_wgoal (code ASPM) (cf (* ?cf2 -0.2))))
	(assert (elective_wgoal (code MITOS) (cf (* ?cf3 -0.2))))
)

;;;* RULE M02    *
;; Management Interest

(defrule determine_student_management_interest

	(logical 
	  (or  (or (management_exp Yes) (management_exp No))
	                (worked No)))
	
	=>
	
	(assert (UI-state (display management_int)
	(relation-asserted management_int)
	(response No)
	(valid-answers Yes No Maybe)))

)

;;;* RULE MI1    *

(defrule student_management_int_weightage_yes ;; Relevant subjects if student is interested in management
                                       
(logical (management_int Yes))

(elective (code ITSM) (cf ?cf1))
(elective (code BPM) (cf ?cf2)) 
(elective (code ASPM) (cf ?cf3))
(elective (code ITL) (cf ?cf4))
(elective (code KM) (cf ?cf5))
(elective (code MITOS) (cf ?cf6))

=>

(assert (elective_wgoal (code ITSM) (cf (* ?cf1 0.9))))
(assert (elective_wgoal (code BPM) (cf (* ?cf2 0.8))))
(assert (elective_wgoal (code ASPM) (cf (* ?cf3 0.8))))
(assert (elective_wgoal (code ITL) (cf (* ?cf4 0.8))))
(assert (elective_wgoal (code KM) (cf (* ?cf5 0.8))))
(assert (elective_wgoal (code MITOS) (cf (* ?cf6 0.8))))

)

;;;* RULE MI2    *

(defrule student_management_int_weightage_no 
;; Reducing weightage for mgmt subjects if not interested in mgmt

	(logical (management_int No))
	
	(elective (code ITSM) (cf ?cf1))
	(elective (code BPM) (cf ?cf2)) 
	(elective (code ASPM) (cf ?cf3))
	(elective (code ITL) (cf ?cf4))
	(elective (code KM) (cf ?cf5))
	(elective (code MITOS) (cf ?cf6))
	
	=>
	
	(assert (elective_wgoal (code ITSM) (cf (* ?cf1 -0.2))))
	(assert (elective_wgoal (code BPM) (cf (* ?cf2 -0.5))))
	(assert (elective_wgoal (code ASPM) (cf (* ?cf3 -0.5))))
	(assert (elective_wgoal (code ITL) (cf (* ?cf4 -0.5))))
	(assert (elective_wgoal (code KM) (cf (* ?cf5 -0.5))))
	(assert (elective_wgoal (code MITOS) (cf (* ?cf6 -0.5))))

)

;;;* RULE MI3    *

(defrule student_management_int_weightage_maybe 
;; If student 'maybe' interested in management 
;; we set cf for mgmt subjects as 0.4
	(logical (management_int Maybe))
	
	(elective (code ITSM) (cf ?cf1))
	(elective (code BPM) (cf ?cf2)) 
	(elective (code ASPM) (cf ?cf3))
	(elective (code ITL) (cf ?cf4))
	(elective (code KM) (cf ?cf5))
	(elective (code MITOS) (cf ?cf6))
	
	=>
	
	(assert (elective_wgoal (code ITSM) (cf (* ?cf1 0.6))))
	(assert (elective_wgoal (code BPM) (cf (* ?cf2 0.4))))
	(assert (elective_wgoal (code ASPM) (cf (* ?cf3 0.4))))
	(assert (elective_wgoal (code ITL) (cf (* ?cf4 0.4))))
	(assert (elective_wgoal (code KM) (cf (* ?cf5 0.4))))
	(assert (elective_wgoal (code MITOS) (cf (* ?cf6 0.4))))

)
                                          

;; Project Management or Enterprise Management
;;;* RULE MI4    *

(defrule determine_student_management_project_enterprise

	(logical (or (management_int Yes) (management_int Maybe))) ;; rule not applicable if mgmt_int = no

=>

	(assert (UI-state (display management_pm_ent)
	(relation-asserted management_pm_ent)
	(response PM)
	(valid-answers PM EM Both)))

)

;;;* RULE MI5    *

(defrule student_management_pm_ent_weightage_pm ;; If student is interested in PM 
                                                ;; boost PM subjects by a 'probably' factor (0.6/Probably)
                                       
	(logical (management_pm_ent PM))
	
	(elective (code BPM) (cf ?cf1)) 
	(elective (code ASPM) (cf ?cf2))
	
	=>
	
	(assert (elective_wgoal (code BPM) (cf (* ?cf1 0.6))))
	(assert (elective_wgoal (code ASPM) (cf (* ?cf2 0.6))))

)

;;;* RULE MI6    *

(defrule student_management_pm_ent_weightage_em ;; If student is interested in EM 
                                                ;; boost EM subjects by a 'probably' factor (0.6/Probably)

	(logical (management_pm_ent EM))
	
	(elective (code ITSM) (cf ?cf1))
	(elective (code ITL) (cf ?cf2))
	(elective (code KM) (cf ?cf3))
	(elective (code MITOS) (cf ?cf4))
	
	=>
	
	(assert (elective_wgoal (code ITSM) (cf (* ?cf1 0.7))))
	(assert (elective_wgoal (code ITL) (cf (* ?cf2 0.6))))
	(assert (elective_wgoal (code KM) (cf (* ?cf3 0.6))))
	(assert (elective_wgoal (code MITOS) (cf (* ?cf4 0.6))))

)

;;;* RULE MI7    *

(defrule student_management_pm_ent_weightage_both ;; If student is interested in both PM and EM 
                                                  ;; we set equal cf for all mgmt subjects (0.4/Maybe)
	(logical (management_pm_ent Both))
	
	(elective (code ITSM) (cf ?cf1))
	(elective (code BPM) (cf ?cf2)) 
	(elective (code ASPM) (cf ?cf3))
	(elective (code ITL) (cf ?cf4))
	(elective (code KM) (cf ?cf5))
	(elective (code MITOS) (cf ?cf6))
	
	=>
	
	(assert (elective_wgoal (code ITSM) (cf (* ?cf1 0.5))))
	(assert (elective_wgoal (code BPM) (cf (* ?cf2 0.4))))
	(assert (elective_wgoal (code ASPM) (cf (* ?cf3 0.4))))
	(assert (elective_wgoal (code ITL) (cf (* ?cf4 0.4))))
	(assert (elective_wgoal (code KM) (cf (* ?cf5 0.4))))
	(assert (elective_wgoal (code MITOS) (cf (* ?cf6 0.4))))

)


;;;;;;;;;;;
;;TECHNICAL
;;;;;;;;;;;


;; programming_exp
;;;* RULE T01    *

(defrule determine_student_programming_exp
(
logical
(management_int No)
)

   =>

   (assert (UI-state (display programming_exp)
                     (relation-asserted programming_exp)
                     (response Medium)
                     (valid-answers High Medium Low)))
)

;;;* RULE TE1    *

(
defrule student_programming_exp_weightage_high
	(logical (programming_exp High))

    (elective (code MWAD)      (cf ?cf2))
	(elective (code EJ)        (cf ?cf3))
	(elective (code CC)        (cf ?cf4))
    (elective (code ENETONE)   (cf ?cf5))
    (elective (code ENETTWO)   (cf ?cf6))
    (elective (code OODP)      (cf ?cf7))
    (elective (code ASWS)      (cf ?cf8))

	=>

	(assert (elective_wgoal (code MWAD)      (cf (* ?cf2 0.8))))
    (assert (elective_wgoal (code EJ)        (cf (* ?cf3 0.8))))
	(assert (elective_wgoal (code CC)        (cf (* ?cf4 0.9))))
    (assert (elective_wgoal (code ENETONE)   (cf (* ?cf5 0.7))))
	(assert (elective_wgoal (code ENETTWO)   (cf (* ?cf6 0.7))))
    (assert (elective_wgoal (code OODP)      (cf (* ?cf7 0.8))))
    (assert (elective_wgoal (code ASWS)      (cf (* ?cf8 0.8))))
   
	
)

;;;* RULE TE2    *

(
defrule student_programming_exp_weightage_medium
	(logical (programming_exp Medium))


    (elective (code EI)     (cf ?cf3))
    (elective (code SWP)    (cf ?cf6))
    
    =>
	
    (assert (elective_wgoal (code EI)     (cf (* ?cf3 0.8))))
    (assert (elective_wgoal (code SWP)    (cf (* ?cf6 0.8))))

)

;;;* RULE TE3    *

(
defrule student_programming_exp_weightage_low
	(logical (programming_exp Low))

    (elective (code SMPI)   (cf ?cf5))
	
    =>

    (assert (elective_wgoal (code SMPI)   (cf (* ?cf5 0.8))))


)

;; programming_int
;; (slot programming_exp (type SYMBOL) (allowed-symbols LOW MEDIUM HIGH NONE) (default NONE))
;; (slot programming_int (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))

;;;* RULE T02   *

(
defrule determine_student_programming_int
(
logical 
(or (or (programming_exp High) (programming_exp Medium) (programming_exp Low))
(or (management_pm_ent PM) (management_pm_ent EM) (management_pm_ent Both)))
)

   =>

   (assert (UI-state (display learn_programming)
                     (relation-asserted programming_int)
                     (response No)
                     (valid-answers Yes No Maybe)))
)

;;;* RULE TI1    *

(
defrule student_learn_programming_int_weightage_yes
	(logical (programming_int Yes))
	

    (elective (code MWAD)      (cf ?cf2))
	(elective (code EJ)        (cf ?cf3))
	(elective (code CC)        (cf ?cf4))
    (elective (code ENETONE)   (cf ?cf5))
    (elective (code ENETTWO)   (cf ?cf6))
    (elective (code OODP)      (cf ?cf7))

	=>


	(assert (elective_wgoal (code MWAD)   (cf (* ?cf2 0.8))))
    (assert (elective_wgoal (code EJ)     (cf (* ?cf3 0.8))))
	(assert (elective_wgoal (code CC)     (cf (* ?cf4 0.9))))
    (assert (elective_wgoal (code ENETONE)(cf (* ?cf5 0.7))))
	(assert (elective_wgoal (code ENETTWO)(cf (* ?cf6 0.7))))
    (assert (elective_wgoal (code OODP)   (cf (* ?cf7 0.8))))


)

;;;* RULE TI2    *

(
defrule student_learn_programming_int_weightage_No
	(logical (programming_int No))

    (elective (code MWAD)      (cf ?cf2))
	(elective (code EJ)        (cf ?cf3))
	(elective (code CC)        (cf ?cf4))
    (elective (code ENETONE)   (cf ?cf5))
    (elective (code ENETTWO)   (cf ?cf6))
    (elective (code OODP)      (cf ?cf7))

	=>


	(assert (elective_wgoal (code MWAD)   (cf (* ?cf2 -0.4))))
    (assert (elective_wgoal (code EJ)     (cf (* ?cf3 -0.4))))
	(assert (elective_wgoal (code CC)     (cf (* ?cf4 -0.5))))
    (assert (elective_wgoal (code ENETONE)(cf (* ?cf5 -0.6))))
	(assert (elective_wgoal (code ENETTWO)(cf (* ?cf6 -0.6))))
    (assert (elective_wgoal (code OODP)   (cf (* ?cf7 0.2))))

)

;;;* RULE TI3    *

(
defrule student_learn_programming_int_weightage_maybe
	(logical (programming_int Maybe))

    (elective (code HCI)      (cf ?cf2))
	(elective (code SWP)      (cf ?cf3))

	=>

	(assert (elective_wgoal (code HCI)     (cf (* ?cf2 0.1))))
    (assert (elective_wgoal (code SWP)     (cf (* ?cf3 0.1))))
)

;; microsoft
;;;* RULE PI1   *

(
defrule determine_student_microsoft
(
logical 
	 (or (programming_int Yes) (programming_int Maybe))
)

   =>

   (assert (UI-state (display microsoft)
                     (relation-asserted microsoft)
                     (response No)
                     (valid-answers Yes No Maybe)))
)

;;;* RULE MS1   *

(
defrule student_microsoft_weightage_yes
	(logical (microsoft Yes))

	(elective (code ENETONE) (cf ?cf1))
	(elective (code ENETTWO) (cf ?cf2))

	=>

	(assert (elective_wgoal (code ENETONE) (cf (* ?cf1 0.9))))
	(assert (elective_wgoal (code ENETTWO) (cf (* ?cf2 0.9))))

)

;;;* RULE MS2   *

(
defrule student_microsoft_weightage_no
	(logical (microsoft No))
	
	(elective (code ENETONE) (cf ?cf1))
	(elective (code ENETTWO) (cf ?cf2))

	=>

	(assert (elective_wgoal (code ENETONE) (cf (* ?cf1 -0.4))))
	(assert (elective_wgoal (code ENETTWO) (cf (* ?cf2 -0.4))))
)

;;;* RULE MS3   *

(
defrule student_microsoft_weightage_maybe
	(logical (microsoft Maybe))

	(elective (code ENETONE) (cf ?cf1))
	(elective (code ENETTWO) (cf ?cf2))

	=>

	(assert (elective_wgoal (code ENETONE) (cf (* ?cf1 0.2))))
	(assert (elective_wgoal (code ENETTWO) (cf (* ?cf2 0.2))))

)

;; opensource
;;;* RULE PI2  *

(
defrule determine_student_opensource
(
logical 
(and (or (microsoft Yes) (microsoft No) (microsoft Maybe))
(or (programming_int Yes) (programming_int Maybe)))
)

   =>

   (assert (UI-state (display opensource)
                     (relation-asserted opensource)
                     (response No)
                     (valid-answers Yes No Maybe)))
)

;;;* RULE OS1  * 

(
defrule student_opensource_weightage_yes
	(logical (opensource Yes))

	(elective (code OSE) (cf ?cf1))

	=>

	(assert (elective_wgoal (code OSE) (cf (* ?cf1 0.9))))

)

;;;* RULE OS2  *

(
defrule student_opensource_weightage_no
	(logical (opensource No))
	
    (elective (code OSE) (cf ?cf1))

	=>

	(assert (elective_wgoal (code OSE) (cf (* ?cf1 -0.3))))
)

;;;* RULE OS3  *

(
defrule student_opensource_weightage_maybe
	(logical (opensource Maybe))

    (elective (code OSE) (cf ?cf1))

	=>

	(assert (elective_wgoal (code OSE) (cf (* ?cf1 0.2))))

)

;; exp_java
;;;* RULE PI3  *

(
defrule determine_student_exp_java
(
logical 
(and (or (programming_int Yes)(programming_int Maybe))
(or (opensource Yes)(opensource No) (opensource Maybe)))
)
   =>

   (assert (UI-state (display exp_java)
                     (relation-asserted exp_java)
                     (response No)
                     (valid-answers Basic Advanced No)))
)

;;;* RULE EJ1  *

(
defrule student_exp_java_weightage_Basic
	(logical (exp_java Basic))


	(elective (code EJ)     (cf ?cf3))
	(elective (code CC)     (cf ?cf4))

	=>

    (assert (elective_wgoal (code EJ)     (cf (* ?cf3 0.4))))
	(assert (elective_wgoal (code CC)     (cf (* ?cf4 0.4))))
)

;;;* RULE EJ2  *

(
defrule student_exp_java_weightage_Advanced
	(logical (exp_java Advanced))


	(elective (code EJ)     (cf ?cf3))
	(elective (code CC)     (cf ?cf4))

	=>

    (assert (elective_wgoal (code EJ)     (cf (* ?cf3 0.9))))
	(assert (elective_wgoal (code CC)     (cf (* ?cf4 0.9))))
)

;;;* RULE EJ3  *

(
defrule student_exp_java_weightage_no
	(logical (exp_java No))

    (elective (code EJ)     (cf ?cf3))
	(elective (code CC)     (cf ?cf4))
    (elective (code EI)     (cf ?cf4))

	=>

    (assert (elective_wgoal (code EJ)     (cf (* ?cf3 -0.4))))
	(assert (elective_wgoal (code CC)     (cf (* ?cf4 -0.4))))
    (assert (elective_wgoal (code EI)     (cf (* ?cf4 0.2))))

)

;; frontend
;;;* RULE PI4 *

(
defrule determine_student_frontend
(
logical 
(and (or (programming_int Yes) (programming_int Maybe))
(or (exp_java Basic) (exp_java Advanced) (exp_java No)))
)
   =>

   (assert (UI-state (display frontend)
                     (relation-asserted frontend)
                     (response No)
                     (valid-answers Yes No Maybe)))
)

;;;* RULE FE1 *

(defrule student_frontend_weightage_yes
	(logical (frontend Yes))
	
    (elective (code SWP) (cf ?cf1))
	(elective (code HCI) (cf ?cf2))

	=>

	(assert (elective_wgoal (code SWP) (cf (* ?cf1 0.8))))
	(assert (elective_wgoal (code HCI) (cf (* ?cf2 0.8))))
)

;;;* RULE FE2 *

(defrule student_frontend_weightage_no
	(logical (frontend No))
	
    (elective (code SWP) (cf ?cf1))
	(elective (code HCI) (cf ?cf2))

	=>

	(assert (elective_wgoal (code SWP) (cf (* ?cf1 -0.4))))
	(assert (elective_wgoal (code HCI) (cf (* ?cf2 -0.4))))

)

;;;* RULE FE3 *

(
defrule student_frontend_weightage_maybe
	(logical (frontend Maybe))
	
    (elective (code SWP) (cf ?cf1))
	(elective (code HCI) (cf ?cf2))

	=>

	(assert (elective_wgoal (code SWP) (cf (* ?cf1 0.2))))
	(assert (elective_wgoal (code HCI) (cf (* ?cf2 0.1))))

)

;; ba
;;;* RULE PI5 *

(
defrule determine_student_ba
(
logical 
(and (or (programming_int Yes) (programming_int Maybe))
(or (frontend Yes) (frontend No) (frontend Maybe)))
)
   =>

   (assert (UI-state (display ba)
                     (relation-asserted badm)
                     (response No)
                     (valid-answers Yes No Maybe)))
)

;;;* RULE BA1 *

(
defrule student_ba_weightage_yes 
	(logical  (badm Yes))

	(elective (code BADM) (cf ?cf1))
    (elective (code TM) (cf ?cf2))
    (elective (code KM) (cf ?cf3))

	=>

	(assert (elective_wgoal (code BADM) (cf (* ?cf1 0.8))))
    (assert (elective_wgoal (code TM)   (cf (* ?cf2 0.8))))
    (assert (elective_wgoal (code TM)   (cf (* ?cf3 0.8))))
)
)

;;;* RULE BA2 *

(
defrule student_ba_weightage_no
	(logical (badm No))

	(elective (code BADM) (cf ?cf1))
    (elective (code TM) (cf ?cf2))
    (elective (code KM) (cf ?cf3))

	=>

	(assert (elective_wgoal (code BADM) (cf (* ?cf1 -0.4))))
    (assert (elective_wgoal (code TM)   (cf (* ?cf2 -0.4))))
    (assert (elective_wgoal (code TM)   (cf (* ?cf3 -0.4))))
)

;;;* RULE BA3 *

(
defrule student_ba_weightage_maybe
	(logical (badm Maybe))

	
	(elective (code BADM) (cf ?cf1))
    (elective (code TM) (cf ?cf2))
    (elective (code KM) (cf ?cf3))

	=>

	(assert (elective_wgoal (code BADM) (cf (* ?cf1 0.2))))
    (assert (elective_wgoal (code TM)   (cf (* ?cf2 0.2))))
    (assert (elective_wgoal (code TM)   (cf (* ?cf3 0.2))))
)

)

;; mobile
;;;* RULE PI6 *

(
defrule determine_student_mobile
(
logical 
(and (or (badm Yes) (badm No) (badm Maybe))
(or (programming_int Yes) (programming_int Maybe)))
)
   =>

   (assert (UI-state (display mobile)
                     (relation-asserted mobile)
                     (response No)
                     (valid-answers Yes No Maybe)))
)

;;;* RULE MB1 *

(
defrule student_mobile_weightage_yes 
	(logical  (mobile Yes))

	(elective (code MWAD) (cf ?cf1))

	=>

	(assert (elective_wgoal (code MWAD) (cf (* ?cf1 0.8))))
)

;;;* RULE MB2 *

(
defrule student_mobile_weightage_no
	(logical (mobile No))

    (elective (code MWAD) (cf ?cf1))

	=>

	(assert (elective_wgoal (code MWAD) (cf (* ?cf1 -0.4))))
)

;;;* RULE MB3 *

(
defrule student_mobile_weightage_maybe
	(logical (mobile Maybe))

	(elective (code MWAD) (cf ?cf1))

	=>

	(assert (elective_wgoal (code MWAD) (cf (* ?cf1 0.2))))

)

;; KE Techniques
;;;* RULE KS1 *

(defrule determine_student_KE

(logical (and (branch SE) 
         (or (programming_int No) 
         (or (mobile No)(mobile Yes)(mobile Maybe)))))
               
=>

(assert (UI-state (display ke)
(relation-asserted ke)
(response No)
(valid-answers Yes No Maybe)))

)

;;;* RULE KS2 *

(defrule student_KE_weightage_yes ;; Subjects that will benefit from KE
                                              ;; Using only 0.6 because prior experience is not a huge factor

(logical (ke Yes))

(elective (code GA) (cf ?cf1))
(elective (code CBR) (cf ?cf2)) 
(elective (code TM) (cf ?cf3))
(elective (code BADM) (cf ?cf4))
(elective (code KM) (cf ?cf5))

=>

(assert (elective_wgoal (code GA) (cf (* ?cf1 0.8))))
(assert (elective_wgoal (code CBR) (cf (* ?cf2 0.9))))
(assert (elective_wgoal (code TM) (cf (* ?cf3 0.8))))
(assert (elective_wgoal (code BADM) (cf (* ?cf4 0.8))))
(assert (elective_wgoal (code KM) (cf (* ?cf5 0.8))))
)

;;;* RULE KS3 *

(defrule student_KE_weightage_no ;; Subjects that might be tough or not-so-relevant w/o mgmt exp

(logical (ke No))

(elective (code GA) (cf ?cf1))
(elective (code CBR) (cf ?cf2)) 
(elective (code TM) (cf ?cf3))
(elective (code BADM) (cf ?cf4))
(elective (code KM) (cf ?cf5))

=>

(assert (elective_wgoal (code GA) (cf (* ?cf1 -0.4))))
(assert (elective_wgoal (code CBR) (cf (* ?cf2 -0.3))))
(assert (elective_wgoal (code TM) (cf (* ?cf3 -0.4))))
(assert (elective_wgoal (code BADM) (cf (* ?cf4 -0.4))))
(assert (elective_wgoal (code KM) (cf (* ?cf5 -0.4))))
)

;;;* RULE KS4 *

(defrule student_KE_weightage_maybe ;; Subjects that might be tough or not-so-relevant w/o mgmt exp

(logical (ke Maybe))

(elective (code GA) (cf ?cf1))
(elective (code CBR) (cf ?cf2)) 
(elective (code TM) (cf ?cf3))
(elective (code BADM) (cf ?cf4))
(elective (code KM) (cf ?cf5))

=>

(assert (elective_wgoal (code GA) (cf (* ?cf1 0.6))))
(assert (elective_wgoal (code CBR) (cf (* ?cf2 0.5))))
(assert (elective_wgoal (code TM) (cf (* ?cf3 0.6))))
(assert (elective_wgoal (code BADM) (cf (* ?cf4 0.6))))
(assert (elective_wgoal (code KM) (cf (* ?cf5 0.6))))
)
;;---
;;GA
;;;* RULE GA1 *
;;---
(defrule determine_student_SoftComputing_interest

(logical (or (ke Yes) (ke Maybe) ))
=>

(assert (UI-state (display soft_computing)
(relation-asserted soft_computing)
(response No)
(valid-answers Yes No)))

)

;;;* RULE GA2 *

(defrule student_SoftComputing_weightage_yes 
                                       
(logical (soft_computing Yes))

(elective (code GA) (cf ?cf1))


=>

(assert (elective_wgoal (code GA) (cf (* ?cf1 0.8))))
)

;;;* RULE GA3 *

(defrule student_SoftComputing_weightage_no 

(logical (soft_computing No))

(elective (code GA) (cf ?cf1))


=>

(assert (elective_wgoal (code GA) (cf (* ?cf1 -0.5))))

)
;;----
;;CBR
;;;* RULE CB1 * 
;;----
(defrule student_trad_KE 
                                                
(logical 
         (or(soft_computing No) (soft_computing Yes)))        


=>

(assert (UI-state (display traditional)
(relation-asserted traditional)
(response No)
(valid-answers Yes No)))

)

;;;* RULE CB2 *

(defrule student_TraditionalKE_weightage_yes 
                                       
(logical (traditional Yes))

(elective (code CBR) (cf ?cf1))


=>

(assert (elective_wgoal (code CBR) (cf (* ?cf1 0.9))))
)


;;;* RULE CB3 *

(defrule student_TraditionalKE_weightage_no 

(logical (traditional No))

(elective (code CBR) (cf ?cf1))


=>

(assert (elective_wgoal (code CBR) (cf (* ?cf1 -0.5))))

)
;;----------
;;BADM & KM
;;* RULE DM1 *
;;----------
(defrule student_DA_KE 
                                                
(logical 
         (or (traditional No)(traditional Yes)))      


=>

(assert (UI-state (display data_analysis)
(relation-asserted data_analysis)
(response No)
(valid-answers Yes No)))

)

;;;* RULE DM2 *

(defrule student_DA_KE_weightage_yes 
                                       
(logical (data_analysis Yes))

(elective (code BADM) (cf ?cf1))
(elective (code KM) (cf ?cf2))

=>

(assert (elective_wgoal (code BADM) (cf (* ?cf1 0.8))))
(assert (elective_wgoal (code KM) (cf (* ?cf2 0.8))))
)

;;;* RULE DM3 *

(defrule student_DA_KE_weightage_no 

(logical (data_analysis No))

(elective (code BADM) (cf ?cf1))
(elective (code KM) (cf ?cf2))

=>

(assert (elective_wgoal (code BADM) (cf (* ?cf1 -0.5))))
(assert (elective_wgoal (code KM) (cf (* ?cf2 -0.5))))

)
;;---
;;TM
;;;* RULE TM1 *
;;---
(defrule student_search_KE 
                                                
(logical 
         (or(data_analysis No)(data_analysis Yes)))        


=>

(assert (UI-state (display search)
(relation-asserted search)
(response No)
(valid-answers Yes No)))

)


;;;* RULE TM2 *

(defrule student_search_KE_weightage_yes 
                                       
(logical (search Yes))

(elective (code TM) (cf ?cf1))

=>

(assert (elective_wgoal (code TM) (cf (* ?cf1 0.8))))

)


;;;* RULE TM3 *

(defrule student_search_KE_weightage_no 

(logical (search No))

(elective (code TM) (cf ?cf1))


=>

(assert (elective_wgoal (code TM) (cf (* ?cf1 -0.5))))


)

;; Research and Innovation
;;************************
;; Are you interested in pursuing new ideas? 
;; Yes => Increase for SI and RAIT + next question
;; No => Negative for SI and RAIT

;; Are you interested in academic research? 
;; Yes => Service Innovation
;; No => RAITONE & RAITTWO
;;************************

;; Mode (e-learning/e-learning support/either/neither)
;;************************
;; Would you like to take up a module supported by e-learning or completely administered by e-learning?
;; Support => MITOS 
;; Complete => ISS
;; Either/OK with both => Increase for both
;; Neither => Negative for both
;;************************

;; Research and Innovation
;;;* RULE RI1 *

(defrule determine_student_ideator ;; question can be whether you have new tech or biz ideas
                                   ;; instead of ideator because everyone will say yes for ideator



(logical (or (or (branch KE) (branch SE))
   		 (or (search No) (search Yes))
   				 (programming_int No)
   				 (ke No)))
=>

(assert (UI-state (display ideator)
(relation-asserted ideator)
(response No)
(valid-answers Yes No)))

)

;;;* RULE RI2 *

(defrule student_ideator_weightage_yes ;; Relevant subjects if student is an ideator
                                       
(logical (ideator Yes))

(elective (code SI) (cf ?cf1))
(elective (code RAITONE) (cf ?cf2)) 
(elective (code RAITTWO) (cf ?cf3))

=>

(assert (elective_wgoal (code SI) (cf (* ?cf1 0.8))))
(assert (elective_wgoal (code RAITONE) (cf (* ?cf2 1.0))))
(assert (elective_wgoal (code RAITTWO) (cf (* ?cf3 1.0))))

)

;;;* RULE RI3 *

(defrule student_ideator_weightage_no ;; Negative weightage for research and innovation if not ideator 

(logical (ideator No))

(elective (code SI) (cf ?cf1))
(elective (code RAITONE) (cf ?cf2)) 
(elective (code RAITTWO) (cf ?cf3))

=>

(assert (elective_wgoal (code SI) (cf (* ?cf1 -0.8))))
(assert (elective_wgoal (code RAITONE) (cf (* ?cf2 -0.8))))
(assert (elective_wgoal (code RAITTWO) (cf (* ?cf3 -0.8))))
)

;; Academic Research
;;;* RULE AR1 *

(defrule determine_student_acad_res

(logical (ideator Yes))

=>

(assert (UI-state (display acad_res)
(relation-asserted acad_res)
(response No)
(valid-answers Yes No)))

)

;;;* RULE AR2 *

(defrule student_acad_res_weightage_yes ;; Boost research heavily if ideator 
                                        ;; and interested in Academic Research
                                       
(logical (acad_res Yes))

(elective (code RAITONE) (cf ?cf1)) 
(elective (code RAITTWO) (cf ?cf2))

=>

(assert (elective_wgoal (code RAITONE) (cf (* ?cf1 1.0))))
(assert (elective_wgoal (code RAITTWO) (cf (* ?cf2 1.0))))

)

;;;* RULE AR3 *

(defrule student_acad_res_weightage_no ;; Negative weightage for RAIT and positive for SI 
                                       ;; if ideator but not interested in Academic Research

(logical (acad_res No))

(elective (code SI) (cf ?cf1))
(elective (code RAITONE) (cf ?cf2)) 
(elective (code RAITTWO) (cf ?cf3))

=>

(assert (elective_wgoal (code SI) (cf (* ?cf1 0.8))))
(assert (elective_wgoal (code RAITONE) (cf (* ?cf2 -0.6))))
(assert (elective_wgoal (code RAITTWO) (cf (* ?cf3 -0.6))))
)


;; Mode - e-learning
;;;* RULE EL1 *

(defrule determine_student_online_courses


(logical 
(or (ideator No)
(or (acad_res Yes) (acad_res No))))

=>

(assert (UI-state (display online_courses)
(relation-asserted online_courses)
(response Neither)
(valid-answers Full Support Both Neither)))

)

;;;* RULE EL2 *

(defrule student_online_courses_weightage_full ;; Fully administered by e-learning
                                       
(logical (online_courses Full))

(elective (code ISS) (cf ?cf1)) 

=>

(assert (elective_wgoal (code ISS) (cf (* ?cf1 1.0))))


)

;;;* RULE EL3 *

(defrule student_online_courses_weightage_support ;; Supported by e-learning

(logical (online_courses Support))

(elective (code MITOS) (cf ?cf1)) 

=>

(assert (elective_wgoal (code MITOS) (cf (* ?cf1 1.0))))
)

;;;* RULE EL4 *

(defrule student_online_courses_weightage_both ;; Both/either is fine

(logical (online_courses Both))

(elective (code MITOS) (cf ?cf1))
(elective (code ISS) (cf ?cf2))

=>

(assert (elective_wgoal (code MITOS) (cf (* ?cf1 0.8))))
(assert (elective_wgoal (code ISS) (cf (* ?cf2 0.8))))

)

;;;* RULE EL5 *

(defrule student_online_courses_weightage_neither ;; Not interested in any kind of e-learning

(logical (online_courses neither))

(elective (code MITOS) (cf ?cf1))
(elective (code ISS) (cf ?cf2))

=>

(assert (elective_wgoal (code MITOS) (cf (* ?cf1 0.8))))
(assert (elective_wgoal (code ISS) (cf (* ?cf2 0.8))))

)

;;;;;;;;;;;
;;INFRASTRUCTURE/BA
;;;;;;;;;;;

;; INFRASTRUCTURE

;; infrastructure=Are you interested in working on applied IT infrastructure?
;;;* RULE IB1 *

(defrule determine_student_infrastructure
(
logical 
(and 
	(or (branch KE) (branch SE))
	(or (online_courses Full) (online_courses Support) (online_courses Both) (online_courses Neither)))
)

   =>

   (assert (UI-state (display infrastructure)
                     (relation-asserted infrastructure)
                     (response No)
                     (valid-answers Yes No Maybe)))
)

;;;* RULE IB2 *

(
defrule student_infrastructure_weightage_yes
	(logical (infrastructure Yes))

    (elective (code CC)       (cf ?cf2))
    (elective (code ISS)      (cf ?cf3))
	(elective (code OSE)      (cf ?cf4))
    
	
    =>
    
    (assert (elective_wgoal (code CC)       (cf (* ?cf2 0.9))))
	(assert (elective_wgoal (code ISS)      (cf (* ?cf3 0.6))))
    (assert (elective_wgoal (code OSE)      (cf (* ?cf4 0.5))))
    
)

;;;* RULE IB2 *

(
defrule student_infrastructure_weightage_maybe
	(logical (infrastructure Maybe))

    (elective (code CC)       (cf ?cf2))
    (elective (code ISS)      (cf ?cf3))
	(elective (code OSE)      (cf ?cf4))
    
    =>
    
    (assert (elective_wgoal (code CC)       (cf (* ?cf2 0.5))))
	(assert (elective_wgoal (code ISS)      (cf (* ?cf3 0.2))))
    (assert (elective_wgoal (code OSE)      (cf (* ?cf4 0.3))))

)

;;;* RULE IB3 *

(
defrule student_infrastructure_weightage_no
	(logical (infrastructure No))

    (elective (code CC)       (cf ?cf2))
    (elective (code ISS)      (cf ?cf3))
	(elective (code OSE)      (cf ?cf4))
    
    =>
    
    (assert (elective_wgoal (code CC)       (cf (* ?cf2 -0.4))))
	(assert (elective_wgoal (code ISS)      (cf (* ?cf3 -0.2))))
    (assert (elective_wgoal (code OSE)      (cf (* ?cf4 -0.2))))

)

;; applied_opensource=Are you interested in implementing and maintaining open source technology?
;;;* RULE AO1 *

(defrule determine_student_applied_opensource
(
logical 
(or (infrastructure No) (infrastructure Yes) (infrastructure Maybe))
)

   =>

   (assert (UI-state (display applied_opensource)
                     (relation-asserted applied_opensource)
                     (response No)
                     (valid-answers Yes No Maybe)))
)

;;;* RULE AO2 *

(
defrule student_applied_opensource_weightage_yes
	(logical (applied_opensource Yes))

	(elective (code OSE)      (cf ?cf4))
    
    =>

    (assert (elective_wgoal (code OSE)      (cf (* ?cf4 1.0))))
    
)

;;;* RULE AO3 *

(
defrule student_applied_opensource_weightage_no
	(logical (applied_opensource No))

	(elective (code OSE)      (cf ?cf4))
    
    =>

    (assert (elective_wgoal (code OSE)      (cf (* ?cf4 -0.3))))
    

)

;;;* RULE AO4 *

(
defrule student_applied_opensource_weightage_maybe
	(logical (applied_opensource Maybe))

	(elective (code OSE)      (cf ?cf4))
    
    =>

    (assert (elective_wgoal (code OSE)      (cf (* ?cf4 0.3))))
)


;; BA

;;;;include after ;;;* RULE AO4 * and before ;; BA


;; #ba_exp
;; ba_exp=Do you have experience in business analysis?
;;;* RULE BA_EXP1 *

(defrule determine_student_ba_exp
(
logical 
(or (applied_opensource No) (applied_opensource Yes) (applied_opensource Maybe))
)

   =>

   (assert (UI-state (display ba_exp)
                     (relation-asserted ba_exp)
                     (response No)
                     (valid-answers Yes No)))
)


;;;;;;;;;

;; #ba_hons
;; ba_hons=Are you interested in  honing your BA skills?
;; * RULE BA_HONS1 *
     
(defrule determine_student_ba_hons
(
logical 
(ba_exp Yes)
)

   =>

   (assert (UI-state (display ba_hons)
                     (relation-asserted ba_hons)
                     (response No)
                     (valid-answers Yes No )))          
)

;; * RULE BA_HONS2 *

(
defrule student_ba_hons_weightage_yes
	(logical (ba_hons Yes))

	(elective (code BPM)      (cf ?cf4))
    (elective (code SWRE)     (cf ?cf5))
    (elective (code SWP)     (cf ?cf6))
    
    =>

    (assert (elective_wgoal (code BPM)      (cf (* ?cf4 0.2))))
    (assert (elective_wgoal (code SWRE)     (cf (* ?cf5 0.2))))
    (assert (elective_wgoal (code ASPM)     (cf (* ?cf6 0.2))))
)

(
defrule student_ba_hons_weightage_no
	(logical (ba_hons No))

	(elective (code BPM)      (cf ?cf4))
    (elective (code SWRE)     (cf ?cf5))
    (elective (code SWP)     (cf ?cf6))
    
    =>

    (assert (elective_wgoal (code BPM)      (cf (* ?cf4 -0.2))))
    (assert (elective_wgoal (code SWRE)     (cf (* ?cf5 -0.2))))
    (assert (elective_wgoal (code ASPM)     (cf (* ?cf6 -0.2))))
)
;;;;;;;;;;;;

;; #ba_int
;; ba_int=Would you be interested in learning business analysis?
;; * RULE BA_INT1 *

(defrule determine_student_ba_int
(
logical 
(ba_exp No) 
)

   =>

   (assert (UI-state (display ba_int)
                     (relation-asserted ba_int)
                     (response No)
                     (valid-answers Yes No )))
)


;;;;;;;;;

;; BA

;; process_imp_reengg=Would you be interesetd in Process improvement and reengineering?
;;;* RULE BA1 *

(defrule determine_student_process_imp_reengg
(
logical 
(or (ba_hons Yes) (ba_int Yes)
))

   =>

   (assert (UI-state (display process_imp_reengg)
                     (relation-asserted process_imp_reengg)
                     (response No)
                     (valid-answers Yes No Maybe)))

)

;;;* RULE PR2 *

(
defrule student_process_imp_reengg_weightage_yes
	(logical (process_imp_reengg Yes))

	(elective (code BPM)      (cf ?cf4))
    (elective (code SWRE)     (cf ?cf5))
    (elective (code ASPM)     (cf ?cf6))
    
    =>

    (assert (elective_wgoal (code BPM)      (cf (* ?cf4 0.8))))
    (assert (elective_wgoal (code SWRE)     (cf (* ?cf5 0.9))))
    (assert (elective_wgoal (code ASPM)     (cf (* ?cf6 0.6))))
)

;;;* RULE PR3 *

(
defrule student_process_imp_reengg_weightage_maybe
	(logical (process_imp_reengg Maybe))

	(elective (code BPM)      (cf ?cf4))
    (elective (code SWRE)     (cf ?cf5))
    
    =>

    (assert (elective_wgoal (code BPM)      (cf (* ?cf4 0.6))))
    (assert (elective_wgoal (code SWRE)     (cf (* ?cf5 0.7))))
)

;;;* RULE PR4 *

(
defrule student_process_imp_reengg_weightage_no
	(logical (process_imp_reengg No))

	(elective (code BPM)      (cf ?cf4))
    (elective (code SWRE)     (cf ?cf5))
    
    =>

    (assert (elective_wgoal (code BPM)      (cf (* ?cf4 -0.4))))
    (assert (elective_wgoal (code SWRE)     (cf (* ?cf5 -0.3))))
)

;; elicitation_and_analytics=Would you like to learn elicitation and analytics?
;;;* RULE EA1 *

(defrule determine_student_elicitation_and_analytics
(logical 
(or (process_imp_reengg Yes) (process_imp_reengg Maybe) (process_imp_reengg No))
)

   =>

   (assert (UI-state (display elicitation_and_analytics)
                     (relation-asserted elicitation_and_analytics)
                     (response No)
                     (valid-answers Yes No)))
)

;;;* RULE EA2 *

(
defrule student_elicitation_and_analytics_weightage_yes
	(logical (elicitation_and_analytics Yes))

    (elective (code SWRE)     (cf ?cf5))

    =>

    (assert (elective_wgoal (code SWRE)     (cf (* ?cf5 1.0))))

)

;;;* RULE EA3 *

(
defrule student_elicitation_and_analytics_weightage_no
	(logical (elicitation_and_analytics No))

    (elective (code SWRE)     (cf ?cf5))

    =>

    (assert (elective_wgoal (code SWRE)     (cf (* ?cf5 -0.4))))
)


;; product_development=Are you interested in product development?
;;;* RULE PD1 *

(defrule determine_student_product_development
(
logical 
(or (or (branch KE) (branch SE))
	 (or (online_courses Full) (online_courses Support) (online_courses Both) (online_courses Neither))
	 (or (ba_hons No) (ba_int No))
	 (or (ideator Yes) (ideator No))
     (or (elicitation_and_analytics Yes) (elicitation_and_analytics No))) 
)

   =>

   (assert (UI-state (display product_development)
                     (relation-asserted product_development)
                     (response No)
                     (valid-answers Yes No Maybe)))
)
)
;;;* RULE PD2 *

(
defrule student_product_development_weightage_yes
	(logical (product_development Yes))

    (elective (code SWP)     (cf ?cf5))
    (elective (code HCI)     (cf ?cf6))
    (elective (code SMPI)     (cf ?cf7))
    =>

    (assert (elective_wgoal (code SWP)     (cf (* ?cf5 0.9))))
    (assert (elective_wgoal (code HCI)     (cf (* ?cf6 0.9))))
    (assert (elective_wgoal (code SMPI)     (cf (* ?cf7 -0.6))))
)

;;;* RULE PD3 *

(
defrule student_product_development_weightage_maybe
	(logical (product_development Maybe))

    (elective (code SWP)     (cf ?cf5))
    (elective (code SMPI)     (cf ?cf7))

    =>

    (assert (elective_wgoal (code SWP)     (cf (* ?cf5 0.2))))
    (assert (elective_wgoal (code SMPI)     (cf (* ?cf7 0.6))))
)

;;;* RULE PD4 *

(
defrule student_product_development_weightage_no
	(logical (product_development No))

    (elective (code SWP)     (cf ?cf5))
    (elective (code SMPI)     (cf ?cf7))
    =>

    (assert (elective_wgoal (code SWP)     (cf (* ?cf5 -0.6))))
    (assert (elective_wgoal (code SMPI)     (cf (* ?cf7 0.9))))
)
)

;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   

;;;****************
;;;* FINAL RULES *
;;;****************

(defrule display_recommendations

   (logical (or (product_development Yes) (product_development No) (product_development Maybe)
   		    )
    )
   =>

   (assert (UI-state (display recommendation)
                     (state final))))

;;;**********************************
;;;* FULL TIME EIGHT SET MAX VALEUS *
;;;**********************************

;;;* RULE FT01 *
(defrule FONE_get_value
	(elective_goal (code ?c) (setf ONE) (cf ?cf1))
=>	
    (if (> ?cf1 ?*FONE*)
        then
    (bind ?*FONE* ?cf1)        
    )

)

;;;* RULE FT02 *
(defrule FTWO_get_value
	(elective_goal (code ?c) (setf TWO) (cf ?cf1))
=>	
    (if (> ?cf1 ?*FTWO*)
        then
    (bind ?*FTWO* ?cf1)        
    )

)

;;;* RULE FT03 *
(defrule FTHREE_get_value
	(elective_goal (code ?c) (setf THREE) (cf ?cf1))
=>	
    (if (> ?cf1 ?*FTHREE*)
        then
    (bind ?*FTHREE* ?cf1)        
    )

)

;;;* RULE FT04 *
(defrule FFOUR_get_value
	(elective_goal (code ?c) (setf FOUR) (cf ?cf1))
=>	
    (if (> ?cf1 ?*FFOUR*)
        then
    (bind ?*FFOUR* ?cf1)        
    )

)

;;;* RULE FT05 *
(defrule FFIVE_get_value
	(elective_goal (code ?c) (setf FIVE) (cf ?cf1))
=>	
    (if (> ?cf1 ?*FFIVE*)
        then
    (bind ?*FFIVE* ?cf1)        
    )
    
)

;;;* RULE FT06 *
(defrule FSIX_get_value
	(elective_goal (code ?c) (setf SIX) (cf ?cf1))
=>	
    (if (> ?cf1 ?*FSIX*)
        then
    (bind ?*FSIX* ?cf1)        
    )
)

;;;* RULE FT07 *
(defrule FSEVEN_get_value
	(elective_goal (code ?c) (setf SEVEN) (cf ?cf1))
=>	
    (if (> ?cf1 ?*FSEVEN*)
        then
    (bind ?*FSEVEN* ?cf1)        
    )
    ;;(printout t crlf "FSEVEN --> "?*FSEVEN* crlf)
)

;;;* RULE FT08 *
(defrule FEIGHT_get_value
	(elective_goal (code ?c) (setf EIGHT) (cf ?cf1))
=>	
    (if (> ?cf1 ?*FEIGHT*)
        then
    (bind ?*FEIGHT* ?cf1)        
    )
)

(deffunction getFONESubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setf ONE)
                                    (= ?f:cf ?*FONE*))))
)

(deffunction getFTWOSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setf TWO)
                                    (= ?f:cf ?*FTWO*))))
)

(deffunction getFTHREESubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setf THREE)
                                    (= ?f:cf ?*FTHREE*))))
)

(deffunction getFFOURSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setf FOUR)
                                    (= ?f:cf ?*FFOUR*))))
)

(deffunction getFFIVESubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setf FIVE)
                                    (= ?f:cf ?*FFIVE*))))
)

(deffunction getFSIXSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setf SIX)
                                    (= ?f:cf ?*FSIX*))))
)

(deffunction getFSEVENSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setf SEVEN)
                                    (= ?f:cf ?*FSEVEN*))))
)

(deffunction getFEIGHTSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setf EIGHT)
                                    (= ?f:cf ?*FEIGHT*))))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PART TIME EIGHT SET MAX VALUES;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; SET ONE
;;;* RULE PT01 *
(defrule PONE_get_value
	(elective_goal (code ?c) (setp ONE) (cf ?cf1))
=>	
    (if (> ?cf1 ?*PONE*)
    then
	    (bind ?*PONE* ?cf1)
	    (bind ?*PONESUB* ?c)        
    )
)
;;;* RULE PT02 *
(defrule PTWO_get_value
	(elective_goal (code ?c) (setp ONE) (cf ?cf1))
	(test (neq ?c ?*PONESUB*))

=>	 
	(if (= (str-compare ?c ?*PONESUB*) 0)
	then
		;;do nothing
		
	else 
		(if (> ?cf1 ?*PTWO*)
        then
		    (bind ?*PTWO* ?cf1)
		    (bind ?*PTWOSUB* ?c)		    
		    (printout t crlf "PARTTIME SET ONE SUB ONE  " ?*PONESUB*)
			(printout t crlf "PARTTIME SET ONE SUB TWO  " ?*PTWOSUB*)        
    	)
	)    
)

;; SET TWO
;;;* RULE PT03 *
(defrule PTHREE_get_value
	(elective_goal (code ?c) (setp TWO) (cf ?cf1))
=>	
    (if (> ?cf1 ?*PTHREE*)
    then
	    (bind ?*PTHREE* ?cf1)
	    (bind ?*PTHREESUB* ?c)        
    )
)

;;;* RULE PT04 *
(defrule PFOUR_get_value
	(elective_goal (code ?c) (setp TWO) (cf ?cf1))
	(test (neq ?c ?*PTHREESUB*))

=>	 
	(if (= (str-compare ?c ?*PTHREESUB*) 0)
	then
		;;do nothing
		
	else 
		(if (> ?cf1 ?*PFOUR*)
        then
		    (bind ?*PFOUR* ?cf1)
		    (bind ?*PFOURSUB* ?c)		    
		    (printout t crlf "PARTTIME SET TWO SUB ONE  " ?*PTHREESUB*)
			(printout t crlf "PARTTIME SET TWO SUB TWO  " ?*PFOURSUB*)        
    	)
	)    
)

;; SET THREE
;;;* RULE PT05 *
(defrule PFIVE_get_value
	(elective_goal (code ?c) (setp THREE) (cf ?cf1))
=>	
    (if (> ?cf1 ?*PFIVE*)
    then
	    (bind ?*PFIVE* ?cf1)
	    (bind ?*PFIVESUB* ?c)        
    )
)

;;;* RULE PT06 *
(defrule PSIX_get_value
	(elective_goal (code ?c) (setp THREE) (cf ?cf1))
	(test (neq ?c ?*PFIVESUB*))

=>	 
	(if (= (str-compare ?c ?*PFIVESUB*) 0)
	then
		;;do nothing
		
	else 
		(if (> ?cf1 ?*PSIX*)
        then
		    (bind ?*PSIX* ?cf1)
		    (bind ?*PSIXSUB* ?c)		    
		    (printout t crlf "PARTTIME SET THREE SUB ONE  " ?*PFIVESUB*)
			(printout t crlf "PARTTIME SET THREE SUB TWO  " ?*PSIXSUB*)        
    	)
	)    
)

;; SET FOUR
;;;* RULE PT07 *
(defrule PSEVEN_get_value
	(elective_goal (code ?c) (setp FOUR) (cf ?cf1))
=>	
    (if (> ?cf1 ?*PSEVEN*)
    then
	    (bind ?*PSEVEN* ?cf1)
	    (bind ?*PSEVENSUB* ?c)        
    )
)

;;;* RULE PT08 *
(defrule PEIGHT_get_value
	(elective_goal (code ?c) (setp FOUR) (cf ?cf1))
	(test (neq ?c ?*PSEVENSUB*))

=>	 
	(if (= (str-compare ?c ?*PSEVENSUB*) 0)
	then
		;;do nothing
		
	else 
		(if (> ?cf1 ?*PEIGHT*)
        then
		    (bind ?*PEIGHT* ?cf1)
		    (bind ?*PEIGHTSUB* ?c)		    
		    (printout t crlf "PARTTIME SET FOUR SUB ONE  " ?*PEIGHTSUB*)
			(printout t crlf "PARTTIME SET FOUR SUB TWO  " ?*PEIGHTSUB*)        
    	)
	)    
)

;; get subject selections for part-time students.
(deffunction getPONESubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setp ONE)
                               		(eq ?f:code ?*PONESUB*)
                                    (= ?f:cf ?*PONE*))))
)

(deffunction getPTWOSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setp ONE)
                               		(eq ?f:code ?*PTWOSUB*)
                                    (= ?f:cf ?*PTWO*))))
)


(deffunction getPTHREESubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setp TWO)
                               		(eq ?f:code ?*PTHREESUB*)
                                    (= ?f:cf ?*PTHREE*))))
)

(deffunction getPFOURSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setp TWO)
                               		(eq ?f:code ?*PFOURSUB*)
                                    (= ?f:cf ?*PFOUR*))))
)


(deffunction getPFIVESubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setp THREE)
                               		(eq ?f:code ?*PFIVESUB*)
                                    (= ?f:cf ?*PFIVE*))))
)

(deffunction getPSIXSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setp THREE)
                               		(eq ?f:code ?*PSIXSUB*)
                                    (= ?f:cf ?*PSIX*))))
)

(deffunction getPSEVENSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setp FOUR)
                               		(eq ?f:code ?*PSEVENSUB*)
                                    (= ?f:cf ?*PSEVEN*))))
)

(deffunction getPEIGHTSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setp FOUR)
                               		(eq ?f:code ?*PEIGHTSUB*)
                                    (= ?f:cf ?*PEIGHT*))))
)
