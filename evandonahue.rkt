#lang racket
(require "schtml.rkt")

(define main-gutter '50px)
(define nav-padding '50px)
(define darkgray "rgb(100, 100, 100)")

(define (style)
  (css `((body display grid
	       gap 50px
	       grid-template-columns (1fr 2fr 1fr)
	       grid-template-rows 100px
	       background-color "rgb(240, 240, 240)"
	       color ,darkgray)
	 (.navborder border-bottom (1px solid ,darkgray))
	 (a text-decoration none color ,darkgray)
	 ((nav a) font-size 1.2em )
	 ("a:hover[href]" color green))))

(define (navigation [curr-page 'index])
  `(((a.tm href "pdf/cv.pdf") CV)
    (,(if (eq? curr-page 'publications) 'a.tm.tb '(a.tm href "publications.html")) Publications)
    ((a.tm href "https://github.com/emdonahue") Software)))

(define (page pageid aside article)
  (html
   `(html
     (head
      ((link rel stylesheet href styles.css))
      (style ,(style))
      ((meta name viewport content "width=device-width,initial-scale=1")))
     (body	   
      ((a.jse.tm.navborder href index.html style (font-size 1.5em)) "Evan Donahue")
      ((nav.jss.faih.psb.navborder style (--s-b 100px)) ,@(navigation pageid))
      ((aside.tr.mbsb.gcs style (--s-b 40px)) ,@aside)
      (article.mbsb ,@article))) #t))

(define (index)
  (page 'index
   `(((p style (font-family monospace))
      (script "document.write(atob(\"ZXZhbi5kb25haHVlQHRjLnUtdG9reW8uYWMuanAK\"))")
      (noscript "Email me at first.last at either the Tokyo College or University of Tokyo domain"))
     ((a href https://www.linkedin.com/in/evanmdonahue) LinkedIn))
   `(((img style (height 250px border (1px solid ,darkgray) padding 5px margin (0 0 20px 20px) float right) src "img/profile.jpg"))
     ((p style (margin-top 0)) "I am a scholar of computational media and a postdoctoral fellow in Tokyo College at the University of Tokyo. My current research focuses on the question of what makes machines seem human? I pursue this question through a combination of science, technology, and media studies, as well as computer science, all oriented around the field of artificial intelligence (AI), and in particular, natural language processing (NLP).")
     (p "In my historical and critical work, I study the history of AI and NLP. I examine how researchers, now and in the past, have drawn on the human, social, and natural sciences to define \"language\" and \"the human,\" and how those definitions have influenced the development of AI technologies.")
     (p "In my computational work, I consider alternative histories and roads not taken to reconceptualize language and the human and with them the design of AI technologies. I build natural language interfaces that explore both the aesthetic and the functional dimensions of communication, and through these study what it means to communicate with a machine."))))

(define (publications)
  (page 'publications
	'("")
	'((p.thi "Donahue, Evan. \"Goals as Constraints: Writing miniKanren Constraints in miniKanren.\" In " (i "miniKanren and Relational Programming Workshop") ", 2023. [" ((a href pdf/donahue_goalsasconstraints2023.pdf) Link) "]")
	  (p.thi "Donahue, Evan. \"All The Microworld's A Stage: Realism in Interactive Fiction and Artificial Intelligence.\" " (i "American Literature") " 1. no. 2. (June 2023): 229-254. [" ((a href https://read.dukeupress.edu/american-literature/article/95/2/229/344238/All-the-Microworld-s-a-Stage-Realism-in) Link) "]")
	  (p.thi "Donahue, Evan. \"Efficient Variational Inference in miniKanren with Weighted Model Counting.\" In " (i "miniKanren and Relational Programming Workshop") ", 2022. [" ((a href pdf/donahue_emkanren2022.pdf) Link) "]")
	  (p.thi "Donahue, Evan. \"Towards an Android Linguistics: Pragmatics, Reflection, and Creativity in Machine Language.\" Proceedings of " (i "Theoretical and Foundational Problems in Information Studies") " 81, no. 1 (July 2022). [" ((a href pdf/donahue_towards2022.pdf) Link) "]")
	  (p.thi "Donahue, Evan. \"Guarded Fresh Goals: Dependency-Directed Introduction of Fresh Logic Variables.\" In " (i "Proceedings of the 2021 miniKanren and Relational Programming Workshop") ". Virtual. 2021. 74-88. Mississauga:
University of Toronto Mississauga [" ((a href "pdf/donahue_guarded2021.pdf") Link) "]")
	  (p.thi "Donahue, Evan. \"Theseus in the Epistemic Labyrinth: A Critical History of the Semantic Differential Method and the Apparent Weight of Color.\" " (i "Machine Intelligences in Context: Beyond the Technological Sublime") ", special issue of " (i "Culture Machine") ", vol. 20, no. 1, 2021. [" ((a href pdf/donahue_semanticdifferential2021.pdf) Link) "]")
	  (p.thi "Donahue, Evan. \"The Last Ship Sails: Raising the Titanic from Black Diamond Bay.\" " (i "Lute & Drum") ", vol. 7, no. 1, 2016. [" ((a href pdf/donahue_blackdiamond2016.pdf) Link) "]"))))


(with-output-to-file "index.html" (lambda () (display (index))) #:exists 'replace)
(with-output-to-file "publications.html" (lambda () (display (publications))) #:exists 'replace)

