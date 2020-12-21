\ProvidesClass{cindoc}[2020/12/20]

\DeclareOption{bw}{%
	\gdef\@textcol{black}
	\gdef\@hdpic{cin_new_bw.png}
}

\DeclareOption{col}{%
	\gdef\@textcol{cinred}
	\gdef\@hdpic{cin_new_col.png}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Default options
\ExecuteOptions{col}
\ProcessOptions \relax

\LoadClass[a4paper, oneside, 12pt]{article}

\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage[usenames]{color}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{layout}
\RequirePackage{scrextend}

\setlength{\topmargin}{0mm}
\setlength{\voffset}{0mm}
\setlength{\headsep}{24pt}
\setlength{\headheight}{8pt}
\setlength{\footskip}{24pt}
\setlength{\textheight}{\paperheight-\headheight-\headsep-\footskip-180pt}
\setlength{\hoffset}{25mm-1in}
\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{0mm}
\setlength{\marginparwidth}{0mm}
\setlength{\marginparsep}{0mm}
\setlength{\textwidth}{\paperwidth-50mm}
\setlength{\parindent}{0mm}
\setlength{\parskip}{.5\baselineskip}
\setlength{\columnsep}{20pt}
\newlength{\signmargin}
\setlength{\signmargin}{0.5\linewidth}

\setlength{\parindent}{0pt}
\setlength{\parskip}{\baselineskip}

\def\author#1{%
	\gdef\@author{#1}}
\def\@author{Autor indefinido}

\def\authortitle#1{%
	\gdef\@authortitle{#1}}
\def\@authortitle{Título do autor indefinido}

\def\phone#1{%
	\gdef\@phone{#1}}
\def\@phone{Fone indefinido}

\def\fax#1{%
	\gdef\@fax{#1}}
\def\@fax{Fax indefinido}

\def\email#1{%
	\gdef\@email{#1}}
\def\@email{Email indefinido}

\def\title#1{%
	\gdef\@title{#1}}
\def\@title{Título indefinido}

\def\location#1{%
	\gdef\@location{#1}}
\def\@location{Recife}

%\definecolor{cinred}{RGB}{219,30,47}
\definecolor{cinred}{RGB}{166,30,47}


\def\@cinfooter{%
	\color{\@textcol}
	\setlength{\tabcolsep}{0pt}
	\footnotesize\sffamily
	\begin{tabular}{p{\linewidth}}
		\hrule
		\begin{center}
			Tel.: \@phone \qquad E-mail: \@email\\
			Av. Jorn. Anibal Fernandes, s/n \quad Cidade Universitária \quad 50740-560 \quad  Recife - PE - Brasil 
		\end{center} 
	\end{tabular}
}

\lhead{}\chead{}\rhead{}
\fancyhead[LE,RO]{\color{\@textcol}\footnotesize\sffamily\thepage}
\fancyhead[RE,LO]{{\vspace{-3pt}\includegraphics[height=12pt]{\@hdpic}}\ \color{\@textcol}\footnotesize\sffamily cin.ufpe.br}
\lfoot{\@cinfooter}\cfoot{}\rfoot{}
\renewcommand{\headrule}{{\color{\@textcol}\hrule}}
\pagestyle{fancy}

\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
\fancyfoot[L]{\@cinfooter}
\renewcommand{\headrule}{}%{\color{\@textcol}\hrule}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}


\def\makeheader{%
	\thispagestyle{plain}
	\vspace*{-78pt}%
	\mbox{\color{\@textcol}
	\setlength{\tabcolsep}{0pt}
	\begin{tabular}{>{\hspace{-2mm}}p{20mm} >{\vspace{-15mm}\sffamily\bfseries\raggedleft}p{\linewidth-22mm}}
		\includegraphics[height=20mm]{\@hdpic} &
		Universidade Federal de Pernambuco\\
		Centro de Informática\\
		\vspace{12pt}
		\hrule
	\end{tabular}
	}
}

\def\maketitle{%
\begin{center}{\large\bfseries\@title}\end{center}}

\def\makedate{
	\bigskip
	\begin{addmargin}[\signmargin]{0pt}
		\@location, \@date
	\end{addmargin}
}

\def\signature {
	\vspace{48pt}
}


\def\makesignature{
	\begin{addmargin}[\signmargin]{0pt}
		\signature~\\
		\textbf{\@author}\\
		\@authortitle
	\end{addmargin}
}
