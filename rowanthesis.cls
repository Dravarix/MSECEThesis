
% rowanthesis class: a custom document styling to be used for a Rowan Thesis and Dissertations
% Updated January 2021

% fixed TOC, LOF, LOT formating prsanchez
% Updated October 2023
% 4 errors stating invalid unit (pt), but the errors don't seem to affect anything. If you fixed it, send me a message so I could fix mine too. ~Paolo

% fixed ToC (Continued) spacing, unbolded page numbers in ToC, fixed invalid unit errors mentioned above, and fixed chair name issues
% Updated July 2023 JT

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rowanthesis}[2020/01/13 Rowan Thesis Class]

% Use the report class options within this class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass{report}

%-----------------package imports------------------------------------%
\RequirePackage{graphicx}  
\RequirePackage{lipsum}
\RequirePackage[letterpaper, left=1.5in, right=1in, top=1in, bottom=1in]{geometry}
\RequirePackage{multicol}
\RequirePackage{setspace} 
 \usepackage{mathptmx}
\RequirePackage[explicit]{titlesec}  
\RequirePackage[titles]{tocloft}
\RequirePackage{etoolbox}
\patchcmd{\@chapter}
  {\addtocontents{lof}{\protect\addvspace{10\p@}}}
  {}{}{}
\patchcmd{\@chapter}
  {\addtocontents{lot}{\protect\addvspace{10\p@}}}
  {}{}{}
\RequirePackage{ifoddpage} 
\RequirePackage[backend=biber,sorting=none,bibstyle=ieee]{biblatex}
\RequirePackage[titletoc]{appendix}
\RequirePackage{url} 
\RequirePackage{caption} 
\RequirePackage{subcaption}
\RequirePackage{doi} 
\RequirePackage{indentfirst}
\RequirePackage{placeins}
\RequirePackage{multirow,booktabs,setspace,caption}
\RequirePackage{tikz}
\RequirePackage{array}
\RequirePackage{changepage}
\RequirePackage{chemscheme}
\RequirePackage{tocbasic}
\RequirePackage{float}
\floatstyle{plaintop}
\RequirePackage{amsmath}
\RequirePackage{etoolbox}


% custom headers for toc, lof, and lot
\RequirePackage{fancyhdr}

%-----------------------------------------------------------------------%

%----------------------------------Misc---------------------------------%

\doublespacing  
\AtBeginDocument{\renewcommand{\ref}[1]{\autoref{#1}}} 
\urlstyle{same} 
\hbadness=10000 

% Table and Figure Formatting
\renewcommand{\arraystretch}{2}
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}p{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}p{#1}}
\DeclareCaptionLabelSeparator*{spaced}{\\[2ex]}

\captionsetup[table]{textfont=it,format=plain,justification=justified,
  singlelinecheck=false,labelsep=spaced,skip=0pt, labelfont=bf, skip=10pt}
\restylefloat{table}
\captionsetup[figure]{textfont=it,format=plain,justification=justified,
  singlelinecheck=false,labelsep=spaced,skip=0pt, labelfont=bf, skip=10pt}
\restylefloat{figure}
\captionsetup[scheme]{textfont=it,format=plain,justification=justified,
  singlelinecheck=false,labelsep=spaced,skip=0pt, labelfont=bf, skip=10pt}
\restylefloat{scheme}
%------------------------------------------------------------------------%

%---------------------------------Author Info----------------------------%
% modify macro's that contains the @ symbol
\makeatletter

% tokens for author info
\newcommand{\doclevel}[1]{\gdef\@doclevel{#1}}
\newcommand{\@doclevel}{\@latex@warning@no@line{No \noexpand\doclevel given}}
\newcommand{\department}[1]{\gdef\@department{#1}}%
\newcommand{\@department}{\@latex@warning@no@line{No \noexpand\department given}}
\newcommand{\school}[1]{\gdef\@school{#1}}%
\newcommand{\@school}{\@latex@warning@no@line{No \noexpand\school given}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\@degree}{\@latex@warning@no@line{No \noexpand\degree given}}
\newcommand{\dateofdefense}[1]{\gdef\@dateofdefense{#1}}
\newcommand{\@dateofdefense}{\@latex@warning@no@line{No \noexpand\dateofdefense given}}
\newcommand{\chair}[1]{\gdef\@chair{#1}}
\newcommand{\@chair}{\@latex@warning@no@line{No \noexpand\chair given}}
\newcommand{\chairsimple}[1]{\gdef\@chairsimple{#1}}
\newcommand{\@chairsimple}{\@latex@warning@no@line{No \noexpand\chairsimple given}}
\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}
\newcommand{\@copyrightyear}{\@latex@warning@no@line{No \noexpand\copyrightyear given}}
\newcommand{\academicyear}[1]{\gdef\@academicyear{#1}}
\newcommand{\@academicyear}{\@latex@warning@no@line{No \noexpand\academicyear given}}
\newcommand{\committeememberone}[1]{\gdef\@committeememberone{#1}}
\newcommand{\@committeememberone}{\@latex@warning@no@line{No \noexpand\committeememberone given}}
\newcommand{\committeemembertwo}[1]{\gdef\@committeemembertwo{#1}}
\newcommand{\@committeemembertwo}{\@latex@warning@no@line{No \noexpand\committeemembertwo given}}
\newcommand{\committeememberthree}[1]{\gdef\@committeememberthree{#1}}
\newcommand{\@committeememberthree}{\@latex@warning@no@line{No \noexpand\committeememberthree given}}

\makeatother
%------------------------------------------------------------------------%

%--------------------------Frontmatter Environment---------------------%
\newenvironment{frontmatter}
{
    
    \clearpage
    \pagestyle{plain}
    
    % Change Chapter title format
    \titleformat{\chapter}[display]{\normalfont\bfseries\filcenter\doublespacing}{\chaptertitlename\ \thechapter}{0pt}{\MakeUppercase{##1}}
    
}{\clearpage}
%---------------------------------------------------------------------%

%-------------------------Thesisbody Environment----------------------%
\newenvironment{thesisbody}
{
    \restoregeometry
    \clearpage
    \pagestyle{plain}
    \pagenumbering{arabic} % resumes page numbering after front matter
    \setlength{\parindent}{0.5in} % set chapter indent size
    \setcounter{page}{1} % set the page number to 1
    \setcounter{secnumdepth}{4}
    
    % Change header formats
    \titleformat{\chapter}[display]{\normalfont\bfseries\filcenter}{\chaptertitlename\ \thechapter}{0pt}{##1} 
    \titlespacing*{\chapter}
      {0pt}{0pt}{30pt}
      
    \titleformat{\section}{\normalfont\bfseries}{\thesection}{1em}{##1}
    
    \titleformat{\subsection}{\normalfont\bfseries\itshape}{\thesubsection}{1em}{##1}
    
    \titleformat{\subsubsection}[runin]{\normalfont\bfseries}{\hspace{0.5in}\thesubsubsection}{1em}{##1}
    
    \titleformat{\paragraph}[runin]{\normalfont\bfseries\itshape}{\hspace{0.5in}\theparagraph}{1em}{##1}
    
    
}{\clearpage}
\makeatletter
%---------------------------------------------------------------------%

% ------------------ Title Page ------------------%

\newcommand{\makeTitlePage}{
\pagestyle{empty}
\pagenumbering{roman}
\newgeometry{top=1.75in, bottom=0.5in, left=1.5in}
\begin{center}
\begin{singlespacing}

    \textbf{\MakeUppercase{\@title}}\\
    \vspace{1in}
    
    by\\
    \@author\\
    \vspace{1.33in}
    
    A \@doclevel\\
    \vspace{0.33in}
    
    Submitted to the\\
    Department of \@department\\
    College of \@school\\
    In partial fulfillment of the requirement\\
    For the degree of\\
    \@degree\\
    at\\
    Rowan University\\
    \@dateofdefense\\
    \vspace{1.33in}
    
    \@doclevel \hspace{0.1em} Chair: \@chair\\
    
    \vspace{\baselineskip}
    Committee Members:\\
    \@committeememberone\\
    \@committeemembertwo\\
    \@committeememberthree
    
    
    
\end{singlespacing}
\end{center}

\restoregeometry

\begin{center}
\begin{singlespacing}

    \copyright \ \@copyrightyear \ \@author

\end{singlespacing}
\end{center}
\newpage
}
%-------------------------------------------------------%



% ------------------ Abstract Page ------------------%
\newcommand{\buildAbstract}{
\newpage
\pagestyle{plain}
\addcontentsline{toc}{chapter}{Abstract}
\begin{center}
\begin{singlespacing}
    
    \textbf{Abstract}\\
    \vspace{0.33in}
    
    \@author\\
    \MakeUppercase{\@title}\\
    \@academicyear\\
    \@chairsimple\\
    \@degree\\~\\

\end{singlespacing}
\end{center}

\input{Abstract}
}
%-------------------------------------------------------%


% --------------- Table of Contents-----------------------------------%
% Left justify page numbers in their text box
\renewcommand\cftpnumalign{l}

% Edit TOC, LOF, LOT dot spacing
\renewcommand\cftdotsep{1}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftfigleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cfttableader}{\cftdotfill{\cftdotsep}}

% Change fonts
\renewcommand{\cfttoctitlefont}{\normalfont\bfseries} 
\renewcommand{\cftchapfont}{\mdseries} 
\renewcommand{\cftchappagefont}{\mdseries}

% Add the word Chapter before chapter number
\renewcommand{\cftchappresnum}{Chapter }
\renewcommand{\cftchapaftersnum}{:}
\renewcommand{\cftchapnumwidth}{5em}

% Set vertical spacing
\renewcommand{\cftchapafterpnum}{\vskip 18pt} 
\renewcommand{\cftsecafterpnum}{\vskip 18pt}  
\renewcommand{\cftsubsecafterpnum}{\vskip 18pt} 
\renewcommand{\cftsubsubsecafterpnum}{\vskip 18pt}

% Set Indents
\setlength{\cftsecindent}{0.25in}
\setlength{\cftsubsecindent}{0.50in}
\setlength{\cftsubsubsecindent}{0.75in}
\setlength{\cftparaindent}{1in}

\renewcommand\contentsname{\vspace{0.5in} T\MakeLowercase{able of }C\MakeLowercase{ontents}}
\titlespacing*{\chapter}{0pt}{-1.25in}{18pt}

% Add in cont. page
%\RequirePackage{afterpage}
%\DeclareRobustCommand*{\contheading}{%
  %\afterpage{{\normalfont\bfseries\centering
  %\contentsname \hspace{2pt} (Continued)\par\vspace*{0.5in}}}}
  
% Environment
\newcommand{\buildTOC}{
    \newpage % added by prpsanchez
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[C]{\normalfont\bfseries \vspace{-0.5in} Table of Contents (Continued)}
    %\fancyhead[C]{Table of Contents}
    \fancyfoot[C]{\thepage}
    \renewcommand\headrulewidth{0pt}
  
    %\newgeometry{top=0in} % Use if TOC is one page
    %\newgeometry{top=1in} % Use if TOC is more than one page
    \newgeometry{left=1.5in, top=1.5in, bottom=1in, headheight=0.5in, headsep=0.5in}
    
    \begin{singlespace}
        \begin{spacing}{1}
    
            %\setlength{\topmargin}{-1.5in} % Use if TOC is more than one page
            
            % generate TOC
            \setlength{\cftbeforechapskip}{0pt}
            %\addtocontents{toc}{\contheading}
            \tableofcontents
          
    
        \end{spacing}
    \end{singlespace}
    
    \restoregeometry
    \clearpage
}
%-----------------------------------------------------------------------%

% ------------------ List of Figures ------------------%
% Make title Not all caps 
\renewcommand{\listfigurename}{L\MakeLowercase{ist of }F\MakeLowercase{igures}}
\titlespacing*{\chapter}{0pt}{-1.25in}{18pt}

% Add Cont after first page
%\RequirePackage{afterpage}
%\DeclareRobustCommand*{\contlofheading}{%
  %\afterpage{{\normalfont\bfseries\centering
  %\listfigurename \hspace{2pt} (Continued)\par\vspace*{0.5in}}}}

% Place the word figure before figure name
\newlength{\mylen}
\renewcommand{\cftfigpresnum}{\figurename\enspace}
\renewcommand{\cftfigaftersnum}{:}
\settowidth{\mylen}{\cftfigpresnum\cftfigaftersnum}
\addtolength{\cftfignumwidth}{\mylen}

% Change space between Figure # and Figure Title
\renewcommand{\cftfignumwidth}{4.5em}

% Place period after Figure
\renewcommand{\cftfigaftersnum}{.}

% Count for whole doc not by chapter ie 1, 2, 3 instead of 1.1, 1.2, 2.1
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}

% Environment
\newcommand{\buildListOfFigures}{
    \newpage
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[C]{\textbf{\listfigurename \hspace{2pt} (Continued)} \\ \vspace{18pt}
        \hspace{0.2in} Figure ~\hfill Page \hspace{2pt}}
    \fancyfoot[C]{\thepage}
    \renewcommand\headrulewidth{0pt}
    
    %\newgeometry{top=0in} % Use if LOF is one page
    %\newgeometry{top=1in, bottom=0.5in} % Use if LOF is more than one page
    \newgeometry{top=2in, bottom=1in, headheight=46pt}
    
    \addcontentsline{toc}{chapter}{List of Figures}
    \begin{singlespace}
        \begin{spacing}{1}
        
    %\setlength{\topmargin}{-1.5in} % Use if LOF is more than one page
    %\addtocontents{lof}{\contlofheading} % Use if LOF is more than one page
    
    \setlength\cftbeforefigskip{\baselineskip}
    \listoffigures
    
        \end{spacing}
    \addtocontents{lof}{Figure ~\hfill Page\par \vspace{10pt}}

    \end{singlespace}
    \clearpage
    \restoregeometry
}

% ------------------ List of Tables ------------------%
% Make title Not all caps 
\renewcommand{\listtablename}{L\MakeLowercase{ist of }T\MakeLowercase{ables}}
\titlespacing*{\chapter}{0pt}{-1.25in}{18pt}

% Add Cont after first page
%\RequirePackage{afterpage}
%\DeclareRobustCommand*{\contlotheading}{%
  %\afterpage{{\normalfont\bfseries\centering
  %\listtablename \hspace{2pt} (Continued)\par\vspace*{0.5in}}}}

% Place the word table before table name
\newlength{\mytablen}
\renewcommand{\cfttabpresnum}{\tablename\enspace}
\renewcommand{\cfttabaftersnum}{:}
\settowidth{\mytablen}{\cfttabpresnum\cfttabaftersnum}
\addtolength{\cfttabnumwidth}{\mytablen}

% Change space between Table # and Table Title
\renewcommand{\cfttabnumwidth}{4em}

% Place period after Table
\renewcommand{\cfttabaftersnum}{.}

% Count for whole doc not by chapter ie 1, 2, 3 instead of 1.1, 1.2, 2.1
\RequirePackage{chngcntr}
\counterwithout{table}{chapter}

% Environment
\newcommand{\buildListOfTables}{
    \newpage
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[C]{\textbf{\listtablename \hspace{2pt} (Continued)} \\ \vspace{18pt}
        \hspace{0.2in} Table ~\hfill Page \hspace{2pt}}
    \fancyfoot[C]{\thepage}
    \renewcommand\headrulewidth{0pt}
    
    %\newgeometry{top=0in}   % Use if TOC is one page
    %\newgeometry{top=1in} % Use if TOC is two pages
    \newgeometry{top=2in, bottom=1in, headheight=46pt}
    
    \addcontentsline{toc}{chapter}{List of Tables}
    \begin{singlespace}
    \setlength\cftbeforetabskip{\baselineskip}  % manually set spacing between entries
        \begin{spacing}{1}
        
    %\setlength{\topmargin}{-1.5in} % Use if TOC is two pages
    %\addtocontents{lot}{\contlotheading} % Use if TOC is two pages
    
    \listoftables
    
        \end{spacing}
    \addtocontents{lot}{Table ~\hfill Page \par \vspace{10pt}}
    \newpage
    \end{singlespace}
    \restoregeometry
    \clearpage
}

% ------------------ List of Schemes ------------------%
% Make title Not all caps 
\renewcommand{\listschemename}{L\MakeLowercase{ist of }S\MakeLowercase{chemes}}

% Add Cont after first page
\RequirePackage{afterpage}
\DeclareRobustCommand*{\contlosheading}{%
  \afterpage{{
  \par\vspace*{0.75in}
  \normalfont\bfseries\centering
  \listschemename \hspace{2pt} (Continued)\par\vspace*{0.5in}}}}

% Count for whole doc not by chapter ie 1, 2, 3 instead of 1.1, 1.2, 2.1
\counterwithout{scheme}{chapter}

% Edit LOS format to have the words Scheme and Page
\makeatletter
\newcommand*{\addscheme}[1]{Scheme\ #1\unskip.\hfil} 
\def\@dotsep{1}
\DeclareTOCStyleEntry[
    raggedentrytext,
    numwidth=4.75em, 
    numsep=0pt,
    beforeskip=14pt, 
    level=0,
    indent=1.5em,
    rightindent=10em,
    pagenumberbox=\pagenumberbox,
    entrynumberformat=\addscheme
]{tocline}{scheme}
\newcommand*\pagenumberbox[1]{\hspace{0.5em}\mbox{#1 \hspace{0.5em}}}
\makeatother

% Environment
\newcommand{\buildListOfSchemes}{

    \newpage
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[C]{\textbf{\listschemename \hspace{2pt} (Continued)} \\ \vspace{18pt}
        \hspace{0.2in} Scheme ~\hfill Page \hspace{2pt}}
    \fancyfoot[C]{\thepage}
    \renewcommand\headrulewidth{0pt}

    %\newgeometry{top=0in}   % Use if TOC is one page
    % \newgeometry{top=1in} % Use if TOC is more than one page
    \newgeometry{top=2in, bottom=1in, headheight=46pt}

    
    \addcontentsline{toc}{chapter}{List of Schemes}
    \begin{singlespace}
    
        % \setlength{\topmargin}{-1.5in} % Use if TOC is two pages
        % \addtocontents{los}{\contlosheading} % Use if TOC is two pages
        
        \listofschemes
        \addtocontents{los}{Scheme ~\hfill Page\par}
    \newpage
    \end{singlespace}
    \restoregeometry
    \clearpage
}

% ----------------Bibliography-----------------------------%
\addbibresource{references.bib}
\newcommand{\buildBibliography}{
    \clearpage
    \addcontentsline{toc}{chapter}{\protect\hspace{-0.1em} References}
    \begin{centering}
    \textbf{References}\\
    \end{centering}
    \begin{singlespace}
    \setlength\bibitemsep{\baselineskip} 
    \printbibliography[heading=none]
    \end{singlespace}
}


% ----------------Appendix-----------------------------%
  
\makeatletter
\newenvironment{theappendices}{
    
    \begin{appendices}
    
    % Place A in front of LOT and LOF
    \setcounter{figure}{0}
    \renewcommand{\thefigure}{A\arabic{figure}}
    \setcounter{table}{0}
    \renewcommand{\thetable}{A\arabic{table}}
    
    % Change space between Table Number and Table Title
    \addtocontents{lot}{\protect\renewcommand{\protect\cfttabnumwidth}{5em}}
    \addtocontents{lof}{\protect\renewcommand{\protect\cftfignumwidth}{5em}}
    
    \addtocontents{toc}{\protect\renewcommand{\protect\cftsecindent}{0.1em}}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftsecnumwidth}{2em}}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftsecaftersnum}{:}}
    \addtocontents{toc}{
        \begingroup
        \let\protect\l@chapter\protect\l@section
        \let\protect\l@section\protect\l@subsection
    }
}{
    \addtocontents{toc}{\endgroup}
    \end{appendices}
}
\makeatother
%------------------------------------------------------------------------%

