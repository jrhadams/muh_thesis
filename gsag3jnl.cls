% This class file is provided for authors submitting to the
% Genetics Society of America's G3: Genes | Genomes |
% Genetics Journal
%
% Version: 1.8, 2021/07/29
%
% Produced by GSA and Overleaf (www.overleaf.com)
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gsag3jnl}[2021/07/29 v1.8]

%% v1.6: add line numbers toggle
\RequirePackage{xifthen}
\newboolean{displaylineno}
\setboolean{displaylineno}{false}

\AtEndOfClass{\RequirePackage[tracking=smallcaps]{microtype}}
%% v1.6: add line numbers toggle
\DeclareOption{lineno}{\setboolean{displaylineno}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions*
\LoadClass{extarticle}

% Fonts and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{mathpazo}
\RequirePackage[scaled]{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage{url}
\RequirePackage[colorlinks=true, allcolors=blue]{hyperref}
\RequirePackage{pifont}
%% v1.6: add line numbers toggle
\RequirePackage[switch,pagewise]{lineno}

\newcommand{\watermarkfont}{\color{black50}\normalfont\fontsize{10}{12}\selectfont}
\newcommand{\headerfont}{\normalfont\fontsize{8}{10}\selectfont}
\newcommand{\headerifont}{\normalfont\fontsize{7}{9}\selectfont}
\newcommand{\titlefont}{\color{color4}\normalfont\sffamily\bfseries\fontsize{18}{22}\selectfont}
\newcommand{\datesfont}{\normalfont\sffamily\itshape\fontsize{8}{10}\selectfont}
\renewcommand\UrlFont{\color{blue}\sffamily}
\newcommand{\absfont}{\normalfont\sffamily\linespread{1}\fontsize{8.5}{11}\selectfont}
\newcommand{\absheadfont}{\color{color4}\normalfont\sffamily\fontsize{9}{11}\selectfont}
\newcommand{\keywordsfont}{\normalfont\sffamily\linespread{1}\fontsize{8.5}{11}\selectfont}
\newcommand{\keywordheadfont}{\normalfont\sffamily\fontsize{7.8}{9}\selectfont\bfseries}
\newcommand{\copyrightfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}
\newcommand{\footerfont}{\normalfont\sffamily\fontsize{8}{10}\selectfont}

\RequirePackage{datetime}

\newdateformat{monthyeardate}{%
  \monthname[\THEMONTH] \THEYEAR}

\RequirePackage{enumitem}
\setlist[itemize]{noitemsep}


% Author and affiliation
\RequirePackage{authblk}
\setlength{\affilsep}{9pt}
\renewcommand\Authfont{\color{color0}\fontsize{9.5}{11}\sffamily\selectfont}
\renewcommand\Affilfont{\color{color0}\fontsize{6.5}{9}\selectfont}
% \makeatletter
\renewcommand\AB@affilsep{\reset@font\protect\Affilfont}
\renewcommand\AB@affilsepx{\reset@font\protect\\\protect\Affilfont}
%\renewcommand\AB@affilsepx{, \protect\Affilfont}
% \makeatother
\renewcommand\Authands{ and }

% Choose article type
\newcommand*{\articletype}[1]{%
  \RequirePackage{styles/#1}}

% Options for element switching
\RequirePackage{xifthen}
\RequirePackage{etoolbox}
\newboolean{displaycopyright}

% Copyright statement
\RequirePackage{textcomp} % For copyright symbol styling
% \makeatletter
\newcommand{\copyrightstatement}{\textcopyright{} The Author(s) \the\year.}
% \makeatother

% v1.4: Remove copyright statement in PDF
\AtBeginDocument{\setboolean{displaycopyright}{false}}


% Graphics, tables and other formatting
\RequirePackage{graphicx,xcolor}
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{tikz}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{changepage}
\RequirePackage[left=36pt,%
                right=36pt,%
                top=48pt,%
                bottom=60pt,%
                headheight=40pt,%
                headsep=10pt,%
                letterpaper,twoside]{geometry}%
\RequirePackage[labelfont={bf,sf},%
                list=no,%
                labelsep=space,%
                figurename=Figure,%
                singlelinecheck=off,%
                justification=RaggedRight]{caption}
\setlength{\columnsep}{24pt} % Distance between the two columns of text
\setlength{\parindent}{12pt} % Paragraph indent

% Set document color scheme
\definecolor{black50}{gray}{0.5} % 50% black for hrules
\definecolor{color0}{RGB}{0,0,0} % Base color
\definecolor{color1}{RGB}{246, 245, 209} % Table column heads background
% color2 defined by the specific article type style file
\definecolor{color3}{RGB}{0,55,123} % Article Titles
\definecolor{color4}{RGB}{0,76,113} % Subheadings: A heads and “Abstract”
\definecolor{tabledingbat}{RGB}{184,108,108} % Table dingbat icon

% Bibliography
\usepackage{natbib} \bibpunct{(}{)}{;}{author-year}{}{,}
\bibliographystyle{genetics}
\addto{\captionsenglish}{\renewcommand{\refname}{Literature cited}}
\setlength{\bibsep}{0.0pt}

% Table style
\arrayrulecolor{color0} % Set the color of the horizontal rules
\renewcommand{\arraystretch}{1.5} % Increased line spacing
\captionsetup[table]{position=below} % Reduce spacing below caption

% Algorithm style
% \makeatletter
\newcommand\fs@coloruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@coloruled
  \def\@fs@pre{\kern2pt}%
  \def\@fs@post{\kern2pt{\color{color2}\hrule}\relax}%
  \def\@fs@mid{\kern2pt{\color{color2}\hrule}\kern2pt}%
  \let\@fs@iftopcapt\iftrue}
% \makeatother

\floatstyle{coloruled}
\restylefloat{algorithm}

% Headers and footers
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers

\newif\ifslugprint\global\slugprintfalse

\def\ouplogo{\raisebox{24pt}{\fboxsep0pt\fcolorbox{black50}{black50}{\textcolor{white}{\vbox to 62pt{\vfil\hbox to 85pt{\hfil\fontsize{16}{16}\selectfont OXFORD\hfil}\vspace*{10pt}}}}}\hspace*{12pt}}

\def\slugnote{\global\slugprinttrue}

\def\slugline{\vbox{\vspace*{35pt}{\headerfont GENETICS, \the\year, XX(X), XXX\vskip-6pt}%
\rule{121pt}{2pt}\par%
{\headerifont\color{color3} DOI: 10.1534/genetics.XXX.XXXXXX\vskip1pt}%
{\headerifont Advance Access Publication Date: XX XX XXXX\par}%
{\headerfont \articletypename}}}

\def\firstpageimage{\ouplogo\raisebox{9pt}{\includegraphics[width=1.7129in]{G3Logo_Vert}}}

\fancypagestyle{firststyle}{
   %\fancyhead[R]{{\watermarkfont GENETICS |} \headerfont \articletypename}
   \fancyhead[LO,RE,LE,RO]{}
   \ifslugprint\fancyhead[R]{\hbox{\slugline}}\else\fi%
   \fancyhead[L]{\firstpageimage}
    % v1.6: Remove volume and month information
%    \fancyfoot[R]{\footnotesize Genetics, Vol. XXX, XXXX–XXXX \hspace{1em} \monthyeardate\today \hspace{2em} \thepage\ }
}

% Headers
\fancyhead[LO,RE,LE,RO]{} % Blank headers for non-title pages.
% Footers
\lfoot{}
\cfoot{}
\rfoot{}
% \makeatletter
\fancyhead[RO]{\@runningauthor\hspace{2em}\thepage}
\fancyhead[LE]{\thepage\hspace{2em}\@runningtitle}
% \makeatother
\fancyfoot[LO,RE]{}
% \makeatother
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule
\newdimen\footrulechange
\footrulechange\columnwidth

% Article type header box
\newcommand{\logomark}{
\begin{textblock}{200}(132,16)
\begin{flushleft}
\includegraphics[width=1.7129in]{G3Logo_Vert}
\end{flushleft}
\end{textblock}
}

% Article type header box
\newcommand{\articletypemark}{
\begin{textblock}{200}(378,36)
\begin{flushright}
{\raggedleft \headerfont\color{black} \textls[96]{\articletypename}}
\end{flushright}
\end{textblock}
}

% Colored margin box
\newcommand{\marginmark}{
\begin{textblock}{72}(506,0)
\noindent
\begin{tikzpicture}[x=1,y=1]
\fill[color=color2] (0,0) rectangle (72,36);
\end{tikzpicture}
\end{textblock}
}

%% 13 July 2016: make sure sections are unnumbered
\setcounter{secnumdepth}{0}
\setcounter{tocdepth}{0}

% Section/subsection/paragraph set-up
\RequirePackage[explicit]{titlesec}
\renewcommand{\thesubsection}{\Alph{subsection}}

\titleformat{\section}
  {\large\sffamily\bfseries\color{color4}}
  {\thesection.}
  {0.5em}
  {#1}
  []
\titleformat{name=\section,numberless}
  {\large\sffamily\bfseries\color{color4}}
  {}
  {0em}
  {#1}
  []
\titleformat{\subsection}
  {\bfseries\fontsize{10}{12}\selectfont}
  {\thesubsection.}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}[runin]
  {\sffamily\bfseries\itshape}
  {\thesubsubsection.}
  {0.5em}
  {#1}
  []
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1}
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt}

% Article meta data additional fields
\newcommand{\runningauthor}[1]{\def\@runningauthor{#1}}
%% Backward compatibility
\newcommand{\correspondingauthor}[1]{\runningauthor{#1}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\runningtitle}[1]{\def\@runningtitle{#1}}

\newcommand{\keywordname}{Keywords:} % Defines the keywords heading name

\def\xabstract{abstract}
\long\def\abstract#1\end#2{\def\two{#2}\ifx\two\xabstract
\long\gdef\theabstract{\ignorespaces#1}
\def\go{\end{abstract}}\else
\typeout{^^J^^J PLEASE DO NOT USE ANY \string\begin\space \string\end^^J
COMMANDS WITHIN ABSTRACT^^J^^J}#1\end{#2}
\gdef\theabstract{\vskip12pt BADLY FORMED ABSTRACT: PLEASE DO
NOT USE {\tt\string\begin...\string\end} COMMANDS WITHIN
THE ABSTRACT\vskip12pt}\let\go\relax\fi
\go}

% Set environment for abstract content and styling
\newcommand{\abscontent}{
\noindent
{%
\parbox{\dimexpr\linewidth}{%
    %% v1.8: turn on line numbers
	\ifthenelse{\boolean{displaylineno}}{\internallinenumbers}{}%
    {\absheadfont\bfseries Abstract}\vskip4pt \absfont \theabstract
}%
\vskip15.5pt%
\noindent
\parbox{\dimexpr\linewidth-2\fboxsep\relax}{%
 %% v1.8: turn on line numbers
\ifthenelse{\boolean{displaylineno}}{\internallinenumbers}{}%
{\keywordheadfont\keywordname}\hspace*{0.1em} \keywordsfont \@keywords%
}%
}%
}%

% Custom title page
\renewcommand{\@maketitle}{\bgroup\setlength{\parindent}{0pt}%
{%
\vskip65pt%
{\raggedright \titlefont \@title\vskip10pt}%
{\raggedright \@author\vskip12pt}
\ifx\@corres\undefined\vskip6.5pt\else\@corres\vskip11.5pt\fi%
}\egroup%
{%
\vskip12pt%
\abscontent
}%
\vskip25pt%
}%

%% v1.6: add line numbers toggle
\ifthenelse{\boolean{displaylineno}}{\appto{\maketitle}{\linenumbers}}{}

% Other packages
\RequirePackage{enumitem} % For reducing bullet list item separation

\RequirePackage{tabularx}

\RequirePackage[flushmargin,ragged]{footmisc}

\newlength{\myFootnoteWidth}%
\newlength{\myFootnoteLabel}%
\setlength{\myFootnoteLabel}{0.5em}
\renewcommand{\@makefntext}[1]{%
  \setlength{\myFootnoteWidth}{\columnwidth}%
  \addtolength{\myFootnoteWidth}{-\myFootnoteLabel}%
  \noindent\makebox[\myFootnoteLabel][r]{\@makefnmark\ }%
  \parbox[t]{\myFootnoteWidth}{#1}
  }

% Commands to set the footnote for the front page.
\renewcommand{\footnoterule}{%
  \kern -3pt
  {\color{black50} \hrule width \footrulechange height 0.5pt}
  \kern 2.5pt
}

\newcommand{\@authfootnote}[2]{%
  \nolinenumbers\begingroup
  \setlength{\myFootnoteLabel}{0em}
  \renewcommand\thefootnote{}\footnote{\footnotelayout\copyrightfont\textsuperscript{#1}#2}%
   \endgroup%
}

\newcommand\blfootnote[1]{%
  \@authfootnote{}{#1}%
%   \begingroup
%   \setlength{\myFootnoteLabel}{0em}
%   \renewcommand\thefootnote{}\footnote{#1}%
%   \addtocounter{footnote}{-1}%
%   \addtocounter{Hfootnote}{-1}%
%   \endgroup%
}

\newcommand\correspondingauthoraffiliation[2][]{%
  \gdef\@corres{\textsuperscript{#1}#2}%
%  \@authfootnote{#1}{#2}%
%%   \begingroup
%%   \setlength{\myFootnoteLabel}{0em}
%%   \renewcommand\thefootnote{}\footnote{\footnotelayout\copyrightfont\textsuperscript{1}#1}%
%%   \endgroup
%  %% v1.6: add line numbers toggle
%  \ifthenelse{\boolean{displaylineno}}{\par\linenumbers}{}
}

\def\dates#1{\gdef\@dates{#1}}

\def\rec#1{\textbf{Recevied:} #1.}
\def\rev#1{\textbf{Revised:} #1}
\def\acc#1{\textbf{Accepted:} #1}


\newcommand{\equalcontrib}[1]{\@authfootnote{#1}{These authors contributed equally to this work.}}

%\newcommand{\firstpagefootnote}{\blfootnote{\copyrightfont \ifthenelse{\boolean{displaycopyright}}{\copyrightstatement}{}\\%
%Manuscript compiled: \today%
%}}

\newcommand{\firstpagefootnote}{\footrulechange\textwidth%
\blfootnote{\hsize\textwidth%doi: 10.1534/genetics.XXX.XXXXXX \\%
%\ifx\@dates\undefined\vskip0pt\else\@dates\vskip0pt\fi%
\copyrightstatement}}

\newenvironment{tableminipage}[1]{\begin{minipage}{#1}\renewcommand\footnoterule{ \kern -1ex}%
\setlength{\myFootnoteLabel}{0.5em}%
}{\end{minipage}}

\def\firstpagebreak{\break\newpage\noindent}

% Package to enable absolute positioning of figures
\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1pt}
\setlength{\TPVertModule}{1pt}
\textblockorigin{0pt}{0pt} % start everything near the top-left corner

