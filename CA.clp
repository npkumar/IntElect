;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic Electives Recommendation System
;; TO-DO
;; 1. Need to write rules for individual subjects, IMP!
;; 2. Rules for individual subjects based on student profile
;; 3. Final recommendation rules for PARTTIME ONLY.
;;
;; getnpk@gmail.com Feb 22 2013
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftemplate student
    (slot id (default M))
    ;;PROFILING
    (slot type (type SYMBOL) (allowed-symbols FULLTIME PARTTIME))    
    (slot branch (type SYMBOL) (allowed-symbols KE SE NONE) (default NONE))
    (slot worked (type SYMBOL) (allowed-symbols YES NO NONE) (default NONE))
    (slot experience (type SYMBOL) (allowed-symbols HIGH MEDIUM LOW NONE) (default NONE))

    ;;TECHNICAL
    (slot programming (type SYMBOL) (allowed-symbols LOW MEDIUM HIGH NONE) (default NONE))
    (slot learn_programming (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot exp_programming (type SYMBOL) (allowed-symbols YES NO NONE) (default NONE))      
    (slot microsoft (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot opensource (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot exp_java (type SYMBOL) (allowed-symbols YES NO NONE) (default NONE))
    (slot frontend (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot ba (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot mobile (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    
    ;;MANAGERIAL
    (slot management (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot pm_em (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot exp_management (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))

    ;;TECHNOPRENURSHIP/ENTERPRISE
    (slot ideator (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot research (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot field_research (type SYMBOL) (allowed-symbols KE SE BIZ NONE) (default NONE))
    (slot proposal_research (type SYMBOL) (allowed-symbols YES NO NONE) (default NONE))
    (slot experience_research (type SYMBOL) (allowed-symbols YES NO NONE) (default NONE))
    (slot new_research (type SYMBOL) (allowed-symbols YES NO NONE) (default NONE))

    ;;INFRASTRUCTURE
    (slot infrastructure (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot applied_opensource (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))

    ;;KE
    (slot ke (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot soft_computing (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot kbs (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot data_analysis (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot search (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
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

;;;;;;;;;;;;;;;;;;;;;;;;;GLOBAL VARS;;;;;;;;;;;;;;;;;;;;

(defglobal
	?*temp* = 0
    ?*FONE* = 0.5
    ?*FTWO* = 0.5
    ?*FTHREE* = 0.5
    ?*FFOUR* = 0
    ?*FFIVE* = 0
    ?*FSIX* = 0
    ?*FSEVEN* = 0
    ?*FEIGHT* = 0

    ?*PONE* = 0
    ?*PTWO* = 0
    ?*PTHREE* = 0
    ?*PFOUR* = 0
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;CF combination;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PERSONAL;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule Personal
    (declare (salience 10))
=>	
	(printout t crlf "Are you a Full time student? (y/n)") 
	(bind ?response (read))
	(if (= (str-compare ?response y) 0)
	then
		(assert (student (id M) (type FULLTIME)))
	else 
		(assert (student (id M) (type PARTTIME)))
	)
	
	(printout t crlf "Are you from the Knowledge Engineering stream? (y/n)") 
	(bind ?response (read))
	
	(if (= (str-compare ?response y) 0)
	then
		(assert (student (id M) (branch KE)))	
        else 
		(assert (student (id M) (branch SE)))
	)

	(printout t crlf "Do you have any work expirence? (y/n)") 
	(bind ?response (read))

	(if (= (str-compare ?response y) 0)
	       	then
        		(assert (student (id M) (worked YES)))	
        	else 
        		(assert (student (id M) (worked NO)))
        )
	
)

(defrule KE_Weightage
    (student (id M) (branch KE))
	(elective (code CBR) (cf ?cf1))
	(elective (code BADM) (cf ?cf2))
	(elective (code KM) (cf ?cf3))
	(elective (code GA) (cf ?cf4))
	(elective (code TM) (cf ?cf5))
=>
		;; Give weightage to all KE related subjects.
		(assert (elective_wgoal (code CBR) (cf (* ?cf1 0.9))))
		(assert (elective_wgoal (code BADM) (cf (* ?cf2 0.9))))
		(assert (elective_wgoal (code KM) (cf (* ?cf3 0.9))))
		(assert (elective_wgoal (code GA) (cf (* ?cf4 0.9))))
		(assert (elective_wgoal (code TM) (cf (* ?cf5 0.9))))
)

(defrule Work_Experience
	(student (id M) (worked YES))
=>
	(printout t crlf "How long have you been working? (l/m/h)")
        (bind ?response (read))
	
	(switch ?response
		(case l then
			(assert(student (id M) (experience LOW))))
		(case m then
			(assert(student (id M) (experience MEDIUM))))
		(case h then
			(assert(student (id M) (experience HIGH))))
	)
)    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;; TECHNICAL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule technical
    (declare (salience 9))
=>
  	(printout t crlf "How would rate yourself in programming? (h/m/l)") 
	(bind ?response (read))
	(switch ?response
		(case l then
			(assert(student (id M) (programming LOW))))
		(case m then
			(assert(student (id M) (programming MEDIUM))))
		(case h then
			(assert(student (id M) (programming HIGH))))
	)    

  	(printout t crlf "Would you be interested in programming? (y/n/m)") 
	(bind ?response (read))
	(switch ?response
		(case y then
			(assert(student (id M) (learn_programming YES))))
		(case n then
			(assert(student (id M) (learn_programming NO))))
		(case m then
			(assert(student (id M) (learn_programming MAYBE))))
	)    

  	(printout t crlf "Do you have any experience in programming? (y/n)") 
	(bind ?response (read))
	(if (= (str-compare ?response y) 0)
	       	then
        		(assert (student (id M) (exp_programming YES)))	
        	else 
        		(assert (student (id M) (exp_programming NO)))
        )

)

(defrule programming_advanced
    ;; DO FOR ALL ADVANCED AND BASIC
    (and (student (id M) (learn_programming YES)) (student (id M) (exp_programming YES)))
    (elective (code MWAD) (cf ?cf1))
    (elective (code EJ) (cf ?cf2))
=>
    (assert (elective_wgoal (code MWAD) (cf (* ?cf1 0.8))))
    (assert (elective_wgoal (code EJ) (cf (* ?cf1 0.8))))
)

(defrule programming_basic
    ;; DO FOR ALL BASIC
    (student (id M) (learn_programming MAYBE))
    (elective (code EI) (cf ?cf1))
=>
    (assert (elective_wgoal (code EI) (cf (* ?cf1 0.8))))
)

(defrule microsoft
    (student (id M) (learn_programming YES))
    (elective (code ENETONE) (cf ?cf1))
    (elective (code ENETTWO) (cf ?cf2))
=>
    (printout t crlf "Would you interested in Microsoft based technologies? (y/n/m)")
    	(bind ?response (read))
	(switch ?response
		(case y then
            (assert (elective_wgoal (code ENETONE) (cf (* ?cf1 0.9))))
            (assert (elective_wgoal (code ENETTWO) (cf (* ?cf1 0.9)))))
		(case m then
            (assert (elective_wgoal (code ENETONE) (cf (* ?cf1 0.6))))
            (assert (elective_wgoal (code ENETTWO) (cf (* ?cf1 0.6)))))
        (case n then
            (assert (elective_wgoal (code ENETONE) (cf (* ?cf1 0.1))))
            (assert (elective_wgoal (code ENETTWO) (cf (* ?cf1 0.1)))))
	)    
)

(defrule opensource
    (or (student (id M) (learn_programming YES)) (student (id M) (learn_programming MAYBE)))
    (elective (code SWP) (cf ?cf1))
=>
    (printout t crlf "Would you interested in Open Source technologies? (y/n/m)")
  	(bind ?response (read))
	(switch ?response
		(case y then
            (assert (student (id M) (opensource YES)))
            (assert (elective_wgoal (code SWP) (cf (* ?cf1 0.9)))))
		(case m then
            (assert (student (id M) (opensource MAYBE)))
            (assert (elective_wgoal (code SWP) (cf (* ?cf1 0.6)))))
        (case n then
            (assert (student (id M) (opensource NO)))
            (assert (elective_wgoal (code SWP) (cf (* ?cf1 0.1)))))
	)    

)

(defrule java
    (or (student (id M) (opensource YES)) (student (id M) (opensource MAYBE)))
    (or (student (id M) (programming HIGH)) (student (id M) (programming MEDIUM)))

    (elective (code EJ) (cf ?cf1))
=>
    (printout t crlf "Do you have experience in Java Progamming?(y/n)")
      	(bind ?response (read))
	(switch ?response
		(case y then
            (assert (student (id M) (exp_java YES)))
            (assert (elective_wgoal (code EJ) (cf (* ?cf1 0.9)))))
        (case n then
            (assert (student (id M) (exp_java NO)))
            (assert (elective_wgoal (code EJ) (cf (* ?cf1 -0.5)))))
	)    
)

(defrule frontend
    (or (student (id M) (programming HIGH)) (student (id M) (programming MEDIUM)))
    (student (id M) (exp_programming YES))
    (elective (code MWAD) (cf ?cf1))
=>
    (printout t crlf "Would you be interested in Frontend development? (y/n/m)")
  	(bind ?response (read))
	(switch ?response
		(case y then
            (assert (student (id M) (frontend YES)))
            (assert (elective_wgoal (code MWAD) (cf (* ?cf1 0.9)))))
		(case m then
            (assert (student (id M) (frontend MAYBE)))
            (assert (elective_wgoal (code MWAD) (cf (* ?cf1 0.4)))))
        (case n then
            (assert (student (id M) (frontend NO)))
            (assert (elective_wgoal (code MWAD) (cf (* ?cf1 -1.0)))))
	)    
    
)

(defrule ba
    (elective (code ISS) (cf ?cf1))
=>
    (printout t crlf "How about subjects related to analytics? (y/n/m)")
  	(bind ?response (read))
	(switch ?response
		(case y then
            (assert (student (id M) (ba YES)))
            (assert (elective_wgoal (code ISS) (cf (* ?cf1 0.9)))))
		(case m then
            (assert (student (id M) (ba MAYBE)))
            (assert (elective_wgoal (code ISS) (cf (* ?cf1 0.4)))))
        (case n then
            (assert (student (id M) (ba NO)))
            (assert (elective_wgoal (code ISS) (cf (* ?cf1 -1.0)))))
	)
)

(defrule mobile
    (student (id M) (learn_programming YES))
    (or (student (id M) (programming HIGH)) (student (id M) (programming MEDIUM)))
    (elective (code MWAD) (cf ?cf1))
=>
    (printout t crlf "Interested in IOS App development?(y/n)")
  	(bind ?response (read))
	(switch ?response
		(case y then
            (assert (student (id M) (mobile YES)))
            (assert (elective_wgoal (code MWAD) (cf (* ?cf1 0.9)))))
		(case m then
            (assert (student (id M) (mobile MAYBE)))
            (assert (elective_wgoal (code MWAD) (cf (* ?cf1 0.4)))))
        (case n then
            (assert (student (id M) (mobile NO)))
            (assert (elective_wgoal (code MWAD) (cf (* ?cf1 -1.0)))))
	)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;MANAGEMENT;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule management
    (declare (salience 8))
    (elective (code EI) (cf ?cf1))
=>
    (printout t crlf "Would you be interested in management?(y/n/m)")
    (bind ?response (read))
    	(switch ?response
		(case y then
            (assert (student (id M) (management YES)))
            (assert (elective_wgoal (code EI) (cf (* ?cf1 0.9)))))
		(case m then
            (assert (student (id M) (management MAYBE)))
            (assert (elective_wgoal (code EI) (cf (* ?cf1 0.4)))))
        (case n then
            (assert (student (id M) (management NO)))
            (assert (elective_wgoal (code EI) (cf (* ?cf1 0.1)))))
	)
)

(defrule exp_management
    (or (student (id M) (management YES)) (student (id M) (management MAYBE)))
    (elective (code BPM) (cf ?cf1))
=>
    (printout t crlf "Do you have any experience in management?(y/n)")
    (bind ?response (read))
    	(switch ?response
		(case y then
            (assert (student (id M) (exp_management YES)))
            (assert (elective_wgoal (code BPM) (cf (* ?cf1 0.9)))))
        (case n then
            (assert (student (id M) (exp_management NO)))
            (assert (elective_wgoal (code BPM) (cf (* ?cf1 0.1)))))
	)
)

(defrule pm_em
    (or (student (id M) (management YES)) (student (id M) (management MAYBE)))
    (elective (code ASPM) (cf ?cf1))
    (elective (code SMPI) (cf ?cf2))
    (elective (code MITOS) (cf ?cf3))    
=>
    (printout t crlf "Interested in project and enterprise management?(y/n/m)")
    (bind ?response (read))
    	(switch ?response
		(case y then
            (assert (student (id M) (pm_em YES)))
            (assert (elective_wgoal (code ASPM) (cf (* ?cf1 0.9))))
            (assert (elective_wgoal (code SMPI) (cf (* ?cf1 0.9))))
            (assert (elective_wgoal (code MITOS) (cf (* ?cf1 0.9)))))        
        (case n then
            (assert (student (id M) (pm_em NO)))
            (assert (elective_wgoal (code ASPM) (cf (* ?cf1 0.9))))
            (assert (elective_wgoal (code SMPI) (cf (* ?cf1 0.9))))
            (assert (elective_wgoal (code MITOS) (cf (* ?cf1 0.9)))))        
        )
)

;;;;;;;;;;;;;;;;;;;;;;;;; INFRASTRUCTURE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule infrastructure
    (declare (salience 7))
    (elective (code CC) (cf ?cf1))
=>
    (printout t crlf "How about something related to applied IT infrastructure?(y/n/m)")
    (bind ?response (read))
  	(switch ?response
		(case y then
            (assert (student (id M) (infrastructure YES)))
            (assert (elective_wgoal (code CC) (cf (* ?cf1 0.9)))))
        (case n then
            (assert (student (id M) (infrastructure NO)))
            (assert (elective_wgoal (code CC) (cf (* ?cf1 0.1)))))
        (case m then
            (assert (student (id M) (infrastructure MAYBE)))
            (assert (elective_wgoal (code CC) (cf (* ?cf1 0.6)))))
    )
)

(defrule applied_opensource 
    (or (student (id M) (infrastructure YES)) (student (id M) (infrastructure MAYBE)))
    (or (student (id M) (opensource YES)) (student (id M) (opensource MAYBE)))
    (elective (code OSE) (cf ?cf1))
=>
    (printout t crlf "Would you like to learn about applying opensource tech into ?(y/n/m)")
    (bind ?response (read))
  	(switch ?response
		(case y then
            (assert (student (id M) (applied_opensource  YES)))
            (assert (elective_wgoal (code OSE) (cf (* ?cf1 0.9)))))
        (case n then
            (assert (student (id M) (applied_opensource  NO)))
            (assert (elective_wgoal (code OSE) (cf (* ?cf1 0.1)))))
        (case m then
            (assert (student (id M) (applied_opensource  MAYBE)))
            (assert (elective_goal (code OSE) (cf (* ?cf1 0.6)))))
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; KE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
(defrule ke
    (declare (salience 6))
    (student (id M) (branch SE))
=>
    (printout t "Are you interested in applying KE techniques to solve real world problems? (y/n/m)")
    (bind ?response (read))
    (switch ?response
		(case y then
            (assert (student (id M) (ke  YES))))
        (case n then
            (assert (student (id M) (ke  NO))))
        (case m then
            (assert (student (id M) (ke  MAYBE))))
    )
)

(defrule soft_computing
    (or (student (id M) (branch SE)) (student (id M) (ke YES)) (student (id M) (ke MAYBE)))
    (elective (code GA) (cf ?cf1))
=>
    (printout t crlf "Interested in soft computing techniques? (y/n/m)")
    (bind ?response (read))
    (switch ?response
		(case y then
            (assert (student (id M) (soft_computing  YES)))
            (assert (elective_wgoal (code GA) (cf (* ?cf1 0.9)))))
        (case n then
            (assert (student (id M) (soft_computing  NO)))
            (assert (elective_wgoal (code GA) (cf (* ?cf1 0.1)))))
        (case m then
            (assert (student (id M) (soft_computing  MAYBE)))
            (assert (elective_wgoal (code GA) (cf (* ?cf1 0.6)))))
    )
)

(defrule search
    (or (student (id M) (branch SE)) (student (id M) (ke YES)) (student (id M) (ke MAYBE)))
    (elective (code TM) (cf ?cf1))
=>
    (printout t crlf "Interested in applying search techniques to textual data? (y/n/m)")
    (bind ?response (read))
    (switch ?response
		(case y then
            (assert (student (id M) (search  YES)))
            (assert (elective_wgoal (code TM) (cf (* ?cf1 0.9)))))
        (case n then
            (assert (student (id M) (search  NO)))
            (assert (elective_wgoal (code TM) (cf (* ?cf1 0.1)))))
        (case m then
            (assert (student (id M) (search  MAYBE)))
            (assert (elective_wgoal (code TM) (cf (* ?cf1 0.6)))))
    )
)

(defrule data_analysis
    (or (student (id M) (branch SE)) (student (id M) (ke YES)) (student (id M) (ke MAYBE)))
    (elective (code BADM) (cf ?cf1))
=>
    (printout t crlf "Interested in data anaylsis? (y/n/m)")
    (bind ?response (read))
    (switch ?response
		(case y then
            (assert (student (id M) (data_analysis  YES)))
            (assert (elective_wgoal (code BADM) (cf (* ?cf1 0.9)))))
        (case n then
            (assert (student (id M) (data_analysis  NO)))
            (assert (elective_wgoal (code BADM) (cf (* ?cf1 0.1)))))
        (case m then
            (assert (student (id M) (data_analysis  MAYBE)))
            (assert (elective_wgoal (code BADM) (cf (* ?cf1 0.6)))))
    )
)

(defrule kbs
    (or (student (id M) (branch SE)) (student (id M) (ke YES)) (student (id M) (ke MAYBE)))
    (or (student (id M) (management YES)) (student (id M) (management MAYBE)))
    (elective (code KM) (cf ?cf1))
=>
    (printout t crlf "How to apply KE techniques in real world situations? (y/n/m)")
    (bind ?response (read))
    (switch ?response
		(case y then
            (assert (student (id M) (kbs  YES)))
            (assert (elective_wgoal (code KM) (cf (* ?cf1 0.9)))))
        (case n then
            (assert (student (id M) (kbs  NO)))
            (assert (elective_wgoal (code KM) (cf (* ?cf1 0.1)))))
        (case m then
            (assert (student (id M) (kbs  MAYBE)))
            (assert (elective_wgoal (code KM) (cf (* ?cf1 0.6)))))
    )
)

;;;;;;;;;;;;;;;;;;;;;;;; INNOVATION AND RESEARCH ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defrule ideator
    (declare (salience 5))
    (elective (code RAITONE) (cf ?cf1))
    (elective (code RAITTWO) (cf ?cf2))
=>
    (printout t crlf "Do you consider yourself an ideator?(y/n/m)")
    (bind ?response (read))
    (switch ?response
		(case y then
            (assert (student (id M) (ideator  YES))))
        (case n then
            (assert (student (id M) (ideator  NO)))
            (assert (elective_wgoal (code RAITONE) (cf (* ?cf1 0.01))))
            (assert (elective_wgoal (code RAITTWO) (cf (* ?cf2 0.01)))))
        (case m then
            (assert (student (id M) (ideator  MAYBE))))
    )
)

(defrule research
    (student (id M) (ideator YES))
    (elective (code RAITONE) (cf ?cf1))
    (elective (code RAITTWO) (cf ?cf2))
=>
    (printout t crlf "Would you like to take up research?(y/n)")
    (bind ?response (read))
    (switch ?response
		(case y then
            (assert (student (id M) (research  YES))))
        (case n then
            (assert (student (id M) (research  NO))))
    )
)

(defrule field_research
    ;; DO FOR SE
    (and 
    (student (id M) (ideator YES))
    (student (id M) (research YES))
    (student (id M) (branch SE)))
    (elective (code RAITONE) (cf ?cf1))
    (elective (code RAITTWO) (cf ?cf2))
=> 
    (assert (elective_wgoal (code RAITONE) (cf (* ?cf1 0.99))))
    (assert (elective_wgoal (code RAITTWO) (cf (* ?cf2 0.99))))
)

(defrule proposal_research
    ;; DO FOR KE
    (and 
    (student (id M) (ideator YES))
    (student (id M) (research YES))
    (student (id M) (branch KE)))
    (elective (code RAITONE) (cf ?cf1))
    (elective (code RAITTWO) (cf ?cf2))
=>
    (printout t crlf "Do you have a good research proposal?(y/n)")
    (bind ?response (read))
    (switch ?response
		(case y then
            (assert (student (id M) (ideator  YES)))
            (assert (elective_wgoal (code RAITONE) (cf (* ?cf1 0.99))))
            (assert (elective_wgoal (code RAITTWO) (cf (* ?cf2 0.99)))))
        (case n then
            (assert (student (id M) (ideator  NO)))
            (assert (elective_wgoal (code RAITONE) (cf (* ?cf1 0.4))))
            (assert (elective_wgoal (code RAITTWO) (cf (* ?cf2 0.4)))))
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;FULL TIME RECOMMENDATIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule FONE_get_value
	(elective_goal (code ?c) (setf FONE) (cf ?cf))
=>	
    (if (> ?cf ?*FONE*)
        then
    (bind ?*FONE* ?cf)        
    )
)

(defrule FONE_get_recommendation
   	(declare (salience -10))
    (elective_goal (name $?n) (code ?c) (setf ONE) (cf ?cf))
=>
    (if (= ?cf ?*FONE*)
    then
        (printout t crlf "FULL TIME PART ONE Elective(s): " ?n " Code: " ?c crlf)
    )
)

(defrule FTWO_get_value
	(elective_goal (code ?c) (setf FTWO) (cf ?cf))
=>	
    (if (> ?cf ?*FTWO*)
        then
    (bind ?*FTWO* ?cf)        
    )
)

(defrule FTWO_get_recommendation
   	(declare (salience -10))
    (elective_goal (name $?n) (code ?c) (setf TWO) (cf ?cf))
=>
    (if (= ?cf ?*FTWO*)
    then
        (printout t crlf "FULL TIME PART TWO Elective(s): " ?n " Code: " ?c crlf)
    )
)

(defrule FTHREE_get_value
	(elective_goal (code ?c) (setf THREE) (cf ?cf))
=>	
    (if (> ?cf ?*FTHREE*)
        then
    (bind ?*FTHREE* ?cf)        
    )
)

(defrule FTHREE_get_recommendation
   	(declare (salience -10))
    (elective_goal (name $?n) (code ?c) (setf THREE) (cf ?cf))
=>
    (if (= ?cf ?*FTHREE*)
    then
        (printout t crlf "FULL TIME PART THREE Elective(s): " ?n " Code: " ?c crlf)
    )
)

(defrule FFOUR_get_value
	(elective_goal (code ?c) (setf FOUR) (cf ?cf))
=>	
    (if (> ?cf ?*FFOUR*)
        then
    (bind ?*FFOUR* ?cf)        
    )
)

(defrule FFOUR_get_recommendation
   	(declare (salience -10))
    (elective_goal (name $?n) (code ?c) (setf FOUR) (cf ?cf))
=>
    (if (= ?cf ?*FFOUR*)
    then
        (printout t crlf "FULL TIME PART FOUR Elective(s): " ?n " Code: " ?c crlf)
    )
)

(defrule FFIVE_get_value
	(elective_goal (code ?c) (setf FIVE) (cf ?cf))
=>	
    (if (> ?cf ?*FFIVE*)
        then
    (bind ?*FFIVE* ?cf)        
    )
    ;;(printout t crlf "Value of cf is " ?*temp*)
)

(defrule FFIVE_get_recommendation
   	(declare (salience -10))
    (elective_goal (name $?n) (code ?c) (setf FIVE) (cf ?cf))
=>
    (if (= ?cf ?*FFIVE*)
    then
        (printout t crlf "FULL TIME PART FIVE Elective(s): " ?n " Code: " ?c crlf)
    )
)

(defrule FSIX_get_value
	(elective_goal (code ?c) (setf SIX) (cf ?cf))
=>	
    (if (> ?cf ?*FSIX*)
        then
    (bind ?*FSIX* ?cf)        
    )
)
(defrule FSIX_get_recommendation
   	(declare (salience -10))
    (elective_goal (name $?n) (code ?c) (setf SIX) (cf ?cf))
=>
    (if (= ?cf ?*FSIX*)
    then
        (printout t crlf "FULL TIME PART SIX Elective(s): " ?n " Code: " ?c crlf)
    )
)

(defrule FSEVEN_get_value
	(elective_goal (code ?c) (setf SEVEN) (cf ?cf))
=>	
    (if (> ?cf ?*FSEVEN*)
        then
    (bind ?*FSEVEN* ?cf)        
    )
)
(defrule FSEVEN_get_recommendation
   	(declare (salience -10))
    (elective_goal (name $?n) (code ?c) (setf SEVEN) (cf ?cf))
=>
    (if (= ?cf ?*FSEVEN*)
    then
        (printout t crlf "FULL TIME PART SEVEN Elective(s): " ?n " Code: " ?c crlf)
    )
)

(defrule FEIGHT_get_value
	(elective_goal (code ?c) (setf EIGHT) (cf ?cf))
=>	
    (if (> ?cf ?*FEIGHT*)
        then
    (bind ?*FEIGHT* ?cf)        
    )
)
(defrule FEIGHT_get_recommendation
   	(declare (salience -10))
    (elective_goal (name $?n) (code ?c) (setf EIGHT) (cf ?cf))
=>
    (if (= ?cf ?*FEIGHT*)
    then
        (printout t crlf "FULL TIME PART EIGHT Elective(s): " ?n " Code: " ?c crlf)
    )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;