%% Class informations
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exampleclass}[2015/12/16 Example LaTeX class]


%% Loads and Definitions
\LoadClass[12pt, a4paper]{article}
\RequirePackage{fancyhdr}
\RequirePackage{fancybox}
\RequirePackage{multicol}
\RequirePackage[table]{xcolor}
\RequirePackage[explicit]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{geometry}
\RequirePackage[colorlinks=true, urlcolor=blue]{hyperref}
\RequirePackage[utf8]{inputenc}


\definecolor{slcolor}{HTML}{E62020}
% \definecolor{slcolor}{RGB}{180,0,0}
\definecolor{color1}{RGB}{0,0,90} % Color of the article title and sections
\definecolor{color2}{RGB}{200,200,200} % Color of the boxes behind the abstract and headings


%% Options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


%----------------------------------------------------------------------
%	SECTION/SUBSECTION/PARAGRAPH SET-UP
%----------------------------------------------------------------------

\titleformat{\section}
  {\color{slcolor}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\arabic{section}. #1}}}
  []
\titleformat{name=\section,numberless}
  {\color{slcolor}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering#1}}}
  []
\titleformat{\subsection}
  {\color{slcolor}\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1}
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

%----------------------------------------------------------------------
%	TABLEOFCONTENTS SET-UP
%----------------------------------------------------------------------
\newlength{\tocsep}
\setlength\tocsep{1.5pc} % Sets the indentation of the sections in the table of contents
\setcounter{tocdepth}{3} % Three levels in the table of contents section: sections, subsections and subsubsections

\usepackage{titletoc}
\contentsmargin{0cm}
\titlecontents{section}[\tocsep]
  {\addvspace{4pt}\small\bfseries\sffamily\color{slcolor}}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\hfill\thecontentspage}
  []
\titlecontents{subsection}[\tocsep]
  {\addvspace{2pt}\sffamily\color{slcolor}}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\ \titlerule*[.5pc]{.}\ \thecontentspage}
  []
\titlecontents*{subsubsection}[\tocsep]
  {\footnotesize\sffamily\color{color2}}
  {}
  {}
  {}
  [\ \textbullet\ ]


%----------------------------------------------------------------------
%	New/renew Commands
%----------------------------------------------------------------------

% document header and footing
\fancypagestyle{firstpagestyle}
{
   \fancyhf{}
   \lhead{\includegraphics[width=3.8cm]{./logo/BGC_logo.png}
   }
   \rhead{\Large \color{slcolor}  \usefont{T1}{fvm}{sb}{n} Economics\&Fixed Income }
   \renewcommand{\headrulewidth}{0.0pt}

    \cfoot{ \color{slcolor}
    \footnotesize
    João Mauricio Rosal, \it{PhD} \\
    \footnotesize
    \Letter\
    \href{mailto:joao.rosal@partners.com}{joao.rosal@bgcpartners.com} \\
    \Telefon\ +55 11 3077-2351 }

}

% \fancypagestyle{plain}{
%   \fancyhf{}
  \lhead{\includegraphics[width=3.0cm]{./logo/BGC_logo.png}}
   \rhead{\large \color{slcolor}  \usefont{T1}{fvm}{sb}{n} Economics\&Fixed Income}

  \cfoot{ \color{slcolor}
    \footnotesize
    João Mauricio Rosal, \it{PhD} \\
    \footnotesize
    \Letter\
    \href{mailto:joao.rosal@partners.com}{joao.rosal@bgcpartners.com} \\
    \Telefon\ +55 11 3077-2351 }
% }



% set default font
\renewcommand*{\familydenfault}{\sfdefault}
\renewcommand{\sfdefault}{pnc}


% Define Separators
\newcommand{\HorRule}[1]{\noindent\rule{\linewidth}{#1}} % Creating a horizontal rule
\newcommand{\SepRule}{\noindent							 % Creating a separator
  \begin{center}
    \rule{250pt}{1pt}
  \end{center}
}
\newcommand{\headlinecolor}{\normalcolor}



% Define Title as News input
\newcommand{\IssueTitle}[1]{%
		\begin{center}
			\Huge \usefont{T1}{fvm}{sb}{n}
                        \vspace*{0.001cm}
			#1%
		\end{center}
		\par \normalsize \normalfont}



\newcommand{\NewsAuthor}[1]{%
			\hfill \upshape{#1} \vspace{4pt}
			\par \normalfont}

\newcommand{\NewsEmail}[1]{%
			\hfill \scriptsize\upshape{\href{mailto:jmrosal@crosal-research}{#1}}\vspace{4pt}
			\par \normalfont}


\newcommand{\JournalIssue}{%
		\hfill \upshape{\mydate \today}
		\par \normalsize \small \vspace{4pt}}

\newcommand{\NewsItem}[1]{%
		\usefont{T1}{augie}{m}{n}
		\large #1 \vspace{2pt}
		\par \normalsize \normalfont}

\newcommand{\Headsep}{
  \color{slcolor}\HorRule{1pt}
}


%% Define rulers
\renewcommand{\headrulewidth}{0.8pt}	% no bar on top of page
\renewcommand{\footrulewidth}{0.4pt}	% bar on bottom of page
\renewcommand{\headrule}{\hbox to\headwidth{
  \color{slcolor}\leaders\hrule height \headrulewidth\hfill}}


%% Define Charts box
\renewcommand{\includegraphics[1]}{\frame{\includegraphics{#1}}}

%% Margins
\geometry{textwidth=16.0cm, left=2.0cm, tmargin=0.5cm,top=2.6cm,
          headheight= 1.0cm, marginparwidth=3.5cm, headsep=0.2cm}
