\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unswmaths}[2013/01/01 Latex class for UNSW Maths documents]

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{epstopdf}

\newtheorem{unswlem}{Lemma}
\newtheorem{unswprp}{Proposition}
\newtheorem{unswthm}{Theorem}
\newtheorem{unswdef}{Definition}
\newtheorem{unswcor}{Corollary}
\newtheorem{unswrem}{Remark}

\setlength{\parindent}{0pt}

\newwrite\plotfile
\newcounter{plotcounter}

\LoadClass{article}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

%arguments in the order, author, student number, subject, title
\newcommand{\unswtitle}[4]{
	\begin{titlepage}
	\begin{center}
	% Upper part of the page. The '~' is needed because \\
	% only works if a paragraph has started.
	\includegraphics[width=1\textwidth]{artwork/unswlogo}~\\[1cm]
	% Upper part of the page. The '~' is needed because \\
	% only works if a paragraph has started.
	\includegraphics[width=0.4\textwidth]{artwork/mathslogo}~\\[1cm]
	\textsc{\LARGE University of New South Wales}\\[0.5cm]
	\textsc{\large School of Mathematics and Statistics}\\[0.5cm]
	% Title
	\HRule \\[0.4cm]
	{ \huge \bfseries #4}\\[0.2cm]
	{ \Large #3 }\\[0.2cm]
	\HRule \\[1.5cm]
	% Author and supervisor
	\begin{minipage}{0.4\textwidth}
	\begin{flushleft} \large
	\emph{Author:}\\
	#1\\
	\end{flushleft}
	\end{minipage}
	\begin{minipage}{0.4\textwidth}
	\begin{flushright} \large
	\emph{Student Number:}\\
	#2
	\end{flushright}
	\end{minipage}
	\vfill
	\end{center}
	\end{titlepage}
}

\newcommand{\unswmathematicaplot}[2]{
	\immediate\openout\plotfile="mathematicaplot.m"
	\immediate\write\plotfile{Export["#2.eps", Plot[#1]]}
	\immediate\closeout\plotfile
	\immediate\write18{math -script "mathematicaplot.m"}
	\includegraphics[width=0.5\textwidth]{#2}~\\[1cm]
}
