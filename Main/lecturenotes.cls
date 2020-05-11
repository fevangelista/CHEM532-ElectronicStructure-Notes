% This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
% To view a copy of this license, visit http://creativecommons.org/licenses/by-nc/4.0/
% or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2019/01/12 Lecture notes class]
\LoadClass{book}

% Page size and margins
\RequirePackage[letterpaper,
	top= 1in,
	bottom= 1in,
	left= 1in,
	right= 2.5in,
	marginparsep = 0.125in,
	marginparwidth = 1.5in]{geometry}

% Scientific packages
\RequirePackage{siunitx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{tikz} % Required for drawing custom shapes
\RequirePackage{tikzsymbols}
\RequirePackage{../Main/latex_qc_notation}
\RequirePackage{topcapt}
\RequirePackage{booktabs}
\RequirePackage{braket}
\RequirePackage{mhchem}
\RequirePackage{cancel}

% Typography
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{titling}
\RequirePackage{enumitem}
\RequirePackage{bbding}
\RequirePackage{caption}
\RequirePackage{setspace}
\RequirePackage{marginnote}
\RequirePackage{mparhack}
\RequirePackage{hyperref}
\RequirePackage{booktabs}
\RequirePackage{xcolor}

\hypersetup{
    colorlinks,
    linkcolor={white!10!black},
    citecolor={orange!80!black},
    urlcolor={red!80!black}
}

% Set fonts
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[ExternalLocation=../Fonts/]{CrimsonText}[ 
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont= *-Bold,
  ItalicFont= *-Italic,
  BoldItalicFont= *-BoldItalic
]
\newfontfamily\headingfont[ExternalLocation=../Fonts/]{RobotoSlab}[ 
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont= *-Bold
]

% Chapter format
\titleformat{\chapter}[display]
 {\color{white!20!black} \huge\headingfont}
 {\color{white!20!black} \bfseries{\large\textsc{CHAPTER}}\ \thechapter \\ \noindent\rule{6in}{0.5pt}}{0pt}
 {\huge }
  
% Section format
\titleformat*{\section}{\color{white!20!black} \large\headingfont\bfseries}

% Subsection format
\titleformat*{\subsection}{\normalsize\headingfont}
%\renewcommand{\maketitlehooka}{\headingfont}
\captionsetup[figure]{margin=0pt,font=small,labelfont=bf,name=Fig.}

%
% Custom colored boxes
%---------------------------------------------------------------------------------
\RequirePackage[framemethod=default]{mdframed} % Required for creating the theorem, definition, exercise and corollary boxes

% Important equation box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=gray,
backgroundcolor=black!5,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=2pt,
innerbottommargin=5pt]{ImportantBox}

%
% Custom theorem styles
%
\newtheoremstyle{ocrenumbox}% % Theorem style name
{0pt}% Space above
{0pt}% Space below
{\normalfont}% % Body font
{}% Indent amount
{\small\bf\color{gray}}% % Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\headingfont\color{gray}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\bfseries\color{black}---\nobreakspace#3.}} % Optional theorem note
\renewcommand{\qedsymbol}{$\blacksquare$}% Optional qed square

\newtheoremstyle{blacknumex}% Theorem style name
{9pt}% Space above
{9pt}% Space below
{\small}% Body font set to small size
{} % Indent amount
{\small\bf\sffamily}% Theorem head font
{\;\newline}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\headingfont{\tiny\ensuremath{\blacksquare}}\nobreakspace\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}
}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\headingfont\bfseries\nobreakspace(#3).}}% Optional theorem note

\newtheoremstyle{blacknumbox} % Theorem style name
{0pt}% Space above
{0pt}% Space below
{\normalfont}% Body font
{}% Indent amount
{\small\bf\sffamily}% Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries---\nobreakspace#3.}}% Optional theorem note

% Exercise box	  
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
backgroundcolor=white,%gray!1,
linecolor=gray,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
innerbottommargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=2pt]{eBox}	

% Defines the theorem text style for each type of theorem to one of the three styles above
\newcounter{dummy} 
\numberwithin{dummy}{section}
\theoremstyle{ocrenumbox}
\newtheorem{problemT}{Problem}[section]
\newtheorem{exerciseT}{Exercise}[section]
\theoremstyle{blacknumex}
\newtheorem{exampleT}{Example}[section]
%\theoremstyle{blacknumbox}
%\newtheorem{importantEquationT}[dummy]{ImportantEquation}


%% A custom itemize env
%
%
%\newenvironment{summary} {
%	\begin{enumerate}[label=(\alph*)]
%	\setlength{\itemsep}{3pt}
%	\setlength{\parskip}{0pt}
%	\setlength{\parsep}{0pt}
%}{
%	\end{enumerate}
%}

\newenvironment{terminal}
{
%\VerbatimEnvironment
\begin{verbatim}
}
%[numbers=left,fontsize=\scriptsize, stepnumber=3,
%                 frame=single,framerule=0.4mm,samepage=true]}
{\end{verbatim}}
% Creates an environment for each type of theorem and assigns it a theorem text style from the "Theorem Styles" section above and a colored box from above
\newenvironment{problem}
	{\begin{eBox}\begin{problemT}}
	{\end{problemT}\vspace{6pt}\end{eBox}}

\newenvironment{example}
	{\begin{exampleT}}
	{\hfill{\tiny\ensuremath{\blacksquare}}\end{exampleT}}

\newenvironment{exercise}
	{\begin{eBox}\begin{exerciseT}}
	{\hfill{\color{gray}\tiny\ensuremath{\blacksquare}}\end{exerciseT}\end{eBox}}			

\newenvironment{ibox}
	{\begin{ImportantBox}}
	{\end{ImportantBox}}

\newenvironment{iequation}
	{\begin{ImportantBox}\begin{equation}}
	{\end{equation}\end{ImportantBox}}

\newenvironment{summary}
	{
	\subsection*{Summary}
		\begin{ImportantBox}
		\begin{itemize}[label=\raisebox{-0.75ex}{\HandRight}]
		\setlength{\itemsep}{3pt}
		\setlength{\parskip}{0pt}
		\setlength{\parsep}{0pt}
	}
	{\end{itemize}\end{ImportantBox}}

% A customized list of items
\newenvironment{myitems}
	{
		\begin{itemize}
		\setlength{\itemsep}{3pt}
		\setlength{\parskip}{0pt}
		\setlength{\parsep}{0pt}
	}
	{\end{itemize}}

\newcounter{mnotecount}
\renewcommand\themnotecount{$^{\arabic{mnotecount}}$}
\newcommand\mnote[1]{
	\refstepcounter{mnotecount}$^{\arabic{mnotecount}}$\marginpar{
		\setstretch{0.9}\themnotecount\textmd{\footnotesize{#1}}
	}
}
\newcommand\mfigure[1]{
	\marginpar{
		\setstretch{0.9}\themnotecount\textmd{\footnotesize{#1}}
	}
}
