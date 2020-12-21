%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ufpeexam.cls
%%% UFPE Exam document class
%%% (C) 2014 Paulo Gustavo Soares da Fonseca
%%% THIS FILE COMES WITH NO WARRANTIES
%%% PERMISSION TO COPY AND REDISTRIBUTE FREE OF CHARGE
%%% FOR ACADEMIC PURPOSES ONLY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%    Author              = "Paulo G. S. Fonseca",
%%%    Version             = "2.0",
%%%    Date                = "Dec 20, 2020",
%%%    Filename            = "ufpeexam.cls",
%%%    Address             = "Universidade Federal de Pernambuco
%%%                           Centro de Informática",
%%%    Telephone           = "+55 81 2126-8430",
%%%    Email               = "paguso@cin.ufpe.br",
%%%    Keywords            = "LaTeX, Thesis, Dissertation",
%%%    Abstract            = "LaTeX document-style for typesetting 
%%%                           exams at UFPE - Brazil"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{ufpeexam}[2014/05/22]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OPTIONS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\DeclareOption{bw}{%
	\gdef\@textcol{black}
	\gdef\@hdpic{logo_bw.png}
}

\DeclareOption{col}{%
	\gdef\@textcol{examcolor}
	\gdef\@hdpic{logo_col.png}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Default options
\ExecuteOptions{col}
\ProcessOptions\relax

\LoadClass[11pt,a4paper]{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{array}
\RequirePackage[brazilian]{babel}
\RequirePackage{calc}
\RequirePackage{color}
\RequirePackage{comment}
\RequirePackage{fancyhdr}
\RequirePackage{framed}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage[utf8]{inputenc}
\RequirePackage{url}
\RequirePackage{xspace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% COLORS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\definecolor{cinred}{RGB}{219,30,47}
\definecolor{examcolor}{RGB}{166,30,47}
\def\textcolor#1{%
	\gdef\@texcol{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LABELS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Language Independent

\gdef\@notdefined{N\~{a}o-definido}
\gdef\@maleauthortitle{Prof.}
\gdef\@femaleauthortitle{Prof$^\text{a}$.}
\gdef\@multauthortitle{Profs.}
\gdef\@answer{Solu\c{c}\~ao}
\gdef\@question{Quest\~ao}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IDENTIFICATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% School identification

\def\university#1{%
  \gdef\@university{#1}}
\def\@university{Universidade Federal de Pernambuco}

\newlength\logoheight
\logoheight=15mm
\def\universitylogo{\includegraphics[height=\logoheight]{\@hdpic}}

\let\@showinstitute=0
\def\institute#1{%
  \let\@showinstitute=1
  \gdef\@institute{#1}}

\let\@showdepartment=0
\def\department#1{%
  \let\@showdepartment=1
  \gdef\@department{#1}}

\let\@showprogram=0
\def\program#1{%
  \let\@showprogram=1
  \gdef\@program{#1}}
\let\@showprogram=0

\def\course{%
  \@ifnextchar [%
    {\@pcourse}%
    {\@pcourse[\@empty]}}
\def\@pcourse[#1]#2{%
  \ifx#1\@empty
    \gdef\@course{#2}
    \gdef\@courseshort{#2}
  \else
    \gdef\@course{#2}
    \gdef\@courseshort{#1}
  \fi}
\def\@course{\@notdefined}
\def\@courseshort{\@notdefined}

\let\@showterm=0
\def\term#1{%
  \let\@showterm=1
  \gdef\@term{#1}}

%% Exam identification

\def\title#1{%
  \gdef\@title{#1}}
\def\@title{\@notdefined}

%% Authors identification

\def\author{%
  \@ifnextchar [%
    {\@pauthor}%
    {\@pauthor[\@empty]}}
\def\@pauthor[#1]#2{%
  \ifx#1\@empty
    \gdef\@authortitle{\@maleauthortitle}
  \else
    \ifx#1s
  		\gdef\@authortitle{\@multauthortitle}
 	\else
  		\gdef\@authortitle{\@femaleauthortitle}
	\fi
  \fi
  \gdef\@author{#2}}
\def\@author{\@notdefined}
\def\@authortitle{\@maleauthortitle}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\topmargin}{0mm}
\setlength{\voffset}{2cm-1in}
\setlength{\headsep}{12pt}
\setlength{\headheight}{8pt}
\setlength{\footskip}{12pt}
\setlength{\textheight}{\paperheight-\headheight-\headsep-\footskip-4cm}
\setlength{\hoffset}{2cm-1in}
\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{0mm}
\setlength{\marginparwidth}{0mm}
\setlength{\marginparsep}{0mm}
\setlength{\textwidth}{\paperwidth-4cm}
\setlength{\parindent}{0mm}
\setlength{\parskip}{.5\baselineskip}
\setlength{\columnsep}{20pt}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headers and footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\makeheader{%
  	\thispagestyle{plain}
	{\color{\@textcol}\sffamily\footnotesize
		%\begin{tabular}{|p{\textwidth-3cm}|p{3cm}|}
		%\hline
		\@university
  		\if\@showinstitute1\\\@institute\fi
  		\if\@showdepartment1\\\@department\fi
  		\if\@showprogram1\\\@program\fi
  		
		\textbf{\@course\if\@showterm1\enspace\@term\fi}\newline
		\@authortitle~\@author\newline
		
		\newlength\goback
		\addtolength\goback\pagetotal
		\vspace*{-\goback}\hfill\input\universitylogo
		\vspace*{-\logoheight}\vspace*{\goback}\vspace*{-\baselineskip}
		
		\begin{nscenter}\normalsize\sffamily\bfseries \@title\ ---\ \@date \end{nscenter}
	}
}

\lhead{}\chead{}\rhead{}
\fancyhead[LE,RO]{\color{\@textcol}\sffamily\scriptsize\thepage}
\fancyhead[RE,LO]{\color{\@textcol}\sffamily\scriptsize\@courseshort\ \ \coltinysq\ \  \@term\ \ \coltinysq \ \ \@title}

\lfoot{}\cfoot{\headrule}\rfoot{}
\renewcommand{\headrule}{{\color{\@textcol}\hrule}}
\pagestyle{fancy}

\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
\cfoot{{\color{\@textcol}\hrule}}
\renewcommand{\headrule}{}%{\color{\@textcol}\hrule}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}


\gdef\@student{Aluno(a)}
\newcommand{\studentsignature}{
	{\color{\@textcol}\sffamily\MakeUppercase{\@student}:\ \hrulefill}
	\medskip
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Instructions box
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{instructions}{%
	\color{\@textcol}
 	\parskip=0pt
	\OuterFrameSep=0pt%.6\baselineskip
	\begin{framed}
	\footnotesize
}
{\end{framed}
 \par\noindent\ignorespacesafterend}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Questions and answers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter{questioncounter}
\setcounter{questioncounter}{0}

\def\questionbullet#1{
	\gdef\@questionbullet{#1}
}
\def\@questionbullet{\colmedsq}

\newlength\questionbulletsep
\questionbulletsep=1em

\let\@showquestionbullets=1
\def\noquestionbullets{%
	\let\@showquestionbullets=0}

\newlength\questionsep
\questionsep=1.5\parsep

\newenvironment{question}[1][\smallskip\\]{%
  \stepcounter{questioncounter}%
  \par\leavevmode%  		  
  \if\@showquestionbullets1\@questionbullet\makebox[\questionbulletsep]{}\fi%
  \textbf{\MakeUppercase{\@question}~\arabic{questioncounter}}~#1}
{%
	\vspace\questionsep
}

\specialcomment{answer}{%
  \par\leavevmode%  		  
  \noindent\textbf{\textsl{\@answer}}%
  \OuterFrameSep=0pt
  \begin{leftbar}\sl
  \gdef\FrameCommand{\vrule width 1pt \hspace{10pt}}
}
{%
  \rm\end{leftbar}
  \vspace\questionsep
}
\def\hideanswers{\excludecomment{answer}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bells and whistles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{nscenter}
 {\parskip=0pt\par\nopagebreak\centering}
 {\par\noindent\ignorespacesafterend}

\newlength\@rbox
\def\colsq#1{\@rbox=#1 \@rbox=-0.5\@rbox \addtolength\@rbox{.5ex}\raisebox{\@rbox}{{\color{\@textcol}\rule{#1}{#1}}}}
\def\coltinysq{\colsq{.6ex}}
\def\colsmallsq{\colsq{.8ex}}
\def\colmedsq{\colsq{1ex}}

\def\bwsq#1{\@rbox=#1 \@rbox=-0.5\@rbox \addtolength\@rbox{.5ex}\raisebox{\@rbox}{\rule{#1}{#1}}}
\def\bwtinysq{\bwsq{.6ex}}
\def\bwsmallsq{\bwsq{.8ex}}
\def\bwmedsq{\bwsq{1ex}}

\renewcommand{\labelitemi}{\bwsmallsq}
\renewcommand{\labelitemii}{\bwtinysq}
\renewcommand{\labelitemiii}{$-$}
\renewcommand{\labelitemiv}{$\cdot$}

\newcommand\scream[1]{$\star\,$\emph{#1}$\,\star$}

\newcommand{\code}[1]{\ensuremath{\text{\texttt{#1}}}}


\newcommand{\eof}{%
	\begin{center}
		%\hrule\texttt{EOF}
		\color{\@textcol}
		$\blacksquare\enspace\blacksquare\enspace\blacksquare$
	\end{center}}

