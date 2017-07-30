% mins.sty
%  Take minutes of meetings
% 2005-Sept-01 Jim Hefferon jhefferon@smcvt.edu
% 2017 Modified by Manuel Jesus Fernandez IEEE SB Seville Member

\usepackage{graphicx}

% --- Class structure: identification part
% ---
\ProvidesClass{mins}[2005/09/01 version 1.00 Minutes of meetings]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: initial code part
% ---


% what is meeting? 
\def\@committeename{}
\newcommand{\setcommittee}[1]{\def\@committee{#1}}
\newcommand{\show@committee}{\@committee}

% who is meeting? 
\def\@members{None}
\newcommand{\setmembers}[1]{\def\@members{#1}}
\newcommand{\show@members}{\@members}
% what role do they have (e.g., chair)
\newcommand{\role}[2]{#1~(#2)}
\newcommand{\chair}[1]{\role{#1}{Chair}}
\newcommand{\vicechair}[1]{\role{#1}{Vice-Chair}}
\newcommand{\secretary}[1]{\role{#1}{Secretario}}
\newcommand{\treasurer}[1]{\role{#1}{Tesorero}}
\newcommand{\rrpp}[1]{\role{#1}{Rel.Pub.}}
\newcommand{\counselor}[1]{\role{#1}{Counselor}}
\newcommand{\vocal}[1]{\role{#1}{Vocal}}

% who is host? 
\global\let\@host\@empty
\newcommand{\sethost}[1]{\def\@host{#1}}
\let\host\sethost %
\newcommand{\show@host}{\@host}

% who is secretary?
\global\let\@sec\@empty
\newcommand{\setsec}[1]{\def\@sec{#1}}
\newcommand{\show@sec}{\@sec}

% who is present?  (not used at the moment)
\global\let\@present\@empty
\newcommand{\setpresent}[1]{\def\@present{#1}}
\newcommand{\show@present}{\@present}

% who is also present?
\global\let\@alsopresent\@empty
\newcommand{\setalsopresent}[1]{\def\@alsopresent{#1}}
\let\alsopresent\setalsopresent %
\newcommand{\show@alsopresent}{\@alsopresent}

% what day is it?
\def\@date{\today}
\newcommand{\setdate}[1]{\def\@date{#1}}
\newcommand{\show@date}{\@date}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article, unless the file
% named "<currentoption>.min" exists, in which case it is loaded
%\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{%
%    \PassOptionsToClass{\CurrentOption}{article}}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{%
    \PassOptionsToClass{\CurrentOption}{article}}}

% --- Class structure: execution of options part
% ---
\ProcessOptions \relax

% --- Class structure: declaration of options part
% ---
\LoadClass{article}

% --- Class structure: main code part
% ---

% material heading the minutes
\newcommand{\head@list}{
\begin{description}
\item[Asistentes:] \show@members
\item[Fecha:] \show@date
\item[Host:] \show@host
\item[Secretario:] \show@sec

\end{description}
}

% basic definition of the minutes environ
\newenvironment{minutes}{%
\begin{center}
{
  \hrulefill \\
  \vskip 1.5ex
  \large\textbf{Reuni\'on IEEE, \show@committee}
  \\ \hrulefill
}  
%\show@date
\end{center}
\vspace{1.5ex}
\head@list
\vspace{1ex}
}{%
}

% environments inside the minutes
\newenvironment{businesslist}[1]{%
%\renewcommand\theenumi{\alph{\enumi}}
\vspace{2ex}\par\noindent\textbf{#1}\par
\begin{enumerate}
}{%
\end{enumerate}
}


\newenvironment{business}{%
\begin{businesslist}{\begin{center}
Desarrollo\\
\hrulefill
\end{center}}
}{%
\end{businesslist}
}

\newenvironment{oldbusiness}{%
\begin{businesslist}{Old Business}
}{%
\end{businesslist}
}

\newenvironment{newbusiness}{%
\begin{businesslist}{New Business}
}{%
\end{businesslist}
}

\newenvironment{announcements}{%
\begin{businesslist}{
\begin{center}
Orden del d\'ia \\
\hrulefill
\end{center}}
}{%
\end{businesslist}
}

% when is the next meeting?
\newcommand{\nextmeeting}[1]{%
\par\noindent\textbf{Next Meeting:} #1\par
}

% OK the minutes of the last meeting
\newcommand{\priormins}{The minutes of the last meeting were approved. }


% Page layout
\RequirePackage[left=1in,right=1in,top=1in,bottom=0.85in,headsep=0.5in]{geometry}

\RequirePackage{fancyhdr}

\fancypagestyle{firstpage}{%
  \fancyhf{} % clear all six fields
  
    \fancyhead[L]{\includegraphics[scale=0.2]{resources/ieeelogo}}
   \fancyhead[R]{\includegraphics[scale=0.11]{resources/IEEE-SB-US}}
   
   \fancyfoot{\includegraphics[width=\paperwidth]{resources/banner}}
   \fancyfootoffset[L]{2.5cm}
   
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{%
  \fancyhf{} % clear all six fields

  \fancyhead[L]{\includegraphics[scale=0.2]{resources/ieeelogo}}
   \fancyhead[R]{\includegraphics[scale=0.11]{resources/IEEE-SB-US}}
   
   \fancyfoot{\includegraphics[width=\paperwidth]{resources/banner}}
   \fancyfootoffset[L]{2.5cm}

  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}


\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}