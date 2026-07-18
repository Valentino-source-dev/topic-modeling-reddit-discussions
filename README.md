# Topic Modeling of Online Discussions using LDA

![R](https://img.shields.io/badge/R-276DC3?style=flat-square&logo=r&logoColor=white)
![LDA](https://img.shields.io/badge/Model-LDA-blueviolet?style=flat-square)
![tidytext](https://img.shields.io/badge/tidyverse-text--mining-1A162D?style=flat-square&logo=tidyverse&logoColor=white)
![Reddit](https://img.shields.io/badge/Reddit-FF4500?style=flat-square&logo=reddit&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-green?style=flat-square)

> Exploratory topic modeling of **50 000+ Reddit comments** from r/technology, r/space, and r/TeslaMotors using Latent Dirichlet Allocation in R.

This repository contains an exploratory text analysis project focused on **topic modeling of online discussions** using **Latent Dirichlet Allocation (LDA)**.

The project analyzes a large corpus of real user-generated texts extracted from Reddit, with the aim of automatically identifying the main latent themes present in informal online conversations.

---

## Pipeline

```mermaid
flowchart LR
    A["Reddit API Scraping"] --> B["Text Preprocessing"]
    B --> C["Tokenization"]
    C --> D["LDA Model"]
    D --> E["Topic Interpretation"]
    E --> F["Model Comparison"]

    style A fill:#FF4500,color:#fff,stroke:#FF4500
    style B fill:#276DC3,color:#fff,stroke:#276DC3
    style C fill:#276DC3,color:#fff,stroke:#276DC3
    style D fill:#7B2D8E,color:#fff,stroke:#7B2D8E
    style E fill:#2E8B57,color:#fff,stroke:#2E8B57
    style F fill:#2E8B57,color:#fff,stroke:#2E8B57
```

---

## Project Overview

In this work, I collected and analyzed textual data from online discussions in order to explore recurring thematic patterns. Online forums were chosen as the object of study because they provide spontaneous, unstructured opinions and arguments produced naturally by users.

The analysis follows an exploratory approach and places particular emphasis on the **qualitative interpretation of topics**, rather than on predictive performance.

---

## Data Collection

| Parameter | Value |
|-----------|-------|
| **Source** | Reddit (via `RedditExtractoR`) |
| **Subreddits** | `r/technology` · `r/space` · `r/TeslaMotors` |
| **Selection** | Top-voted threads from the past month |
| **Max threads** | 200 |
| **Raw corpus** | **50 000+ comments** |

Public discussions were collected using the **RedditExtractoR** package in R, which allows scraping public Reddit content without relying on the official API.

To ensure reproducibility and reduce execution time, the data extraction process was performed in a **separate script**, and the resulting corpus was saved locally in `.rds` format. The analysis presented in this repository loads the data directly from the pre-generated file.

In total, the initial corpus consists of **over 50,000 comments**, drawn from the most upvoted threads of the selected subreddits over the previous month.

---

## Text Preprocessing

Each Reddit comment is treated as a document. The preprocessing pipeline includes:

- Removal of missing or extremely short comments
- Lowercasing
- Removal of URLs, punctuation, and numbers
- Removal of English stopwords
- Custom stopword filtering tailored to online discussion language
- Construction of a Document-Term Matrix (DTM)
- Removal of extremely sparse terms
- Filtering of empty documents

For computational and interpretative reasons, the final analysis is conducted on a **random sample of 8,000 documents**, while preserving sufficient thematic diversity.

---

## Topic Modeling

Two standard **LDA models** were estimated and compared:

| Model | Topics (K) | Characteristics |
|-------|-----------|-----------------|
| LDA‑5 | **K = 5** | Broader, more interpretable themes |
| LDA‑10 | **K = 10** | Higher thematic granularity, increased overlap |

The comparison highlights the trade-off between broader interpretability and finer granularity. The final discussion favors the **K = 5 solution**, which provides a more stable and coherent thematic structure for exploratory purposes.

---

## Topic Interpretation

Topics are interpreted through:
- Inspection of the most probable terms per topic
- Qualitative labeling based on semantic coherence
- Analysis of representative documents with high topic probability

The identified themes reflect recurring discussions around:

| Topic | Theme |
|-------|-------|
| 1 | Digital economy and technology consumption |
| 2 | Work and everyday online experiences |
| 3 | Criticism of technology companies and economic dynamics |
| 4 | Data, privacy, and digital services |
| 5 | Pragmatic evaluations of software and artificial intelligence |

Rather than rigid categories, the topics represent **flexible clusters of discourse**, consistent with the informal and overlapping nature of online conversations.

---

## Repository Structure

```
topic-modeling-online-discussions/
├── README.md                                    # Project documentation
├── LICENSE                                      # MIT License
├── .gitignore                                   # Git ignore rules
├── reddit_scraping.R                            # Data collection script (Reddit)
├── topic-modeling-online-discussions.Rmd         # Full R Markdown analysis
└── topic-modeling-online-discussions.html        # Rendered HTML report (Spanish)
```

---

## Quick Start

### Prerequisites

Install the required R packages:

```r
install.packages(c(
  "RedditExtractoR",
  "tidyverse",
  "tm",
  "stringr",
  "dplyr",
  "slam",
  "topicmodels"
))
```

### 1 — Scrape Reddit data

```bash
Rscript reddit_scraping.R
```

This will collect comments from the three subreddits and save them to `data/all_comments.rds`.

### 2 — Run the analysis

Open `topic-modeling-online-discussions.Rmd` in RStudio and **Knit** to HTML, or run from the command line:

```bash
Rscript -e "rmarkdown::render('topic-modeling-online-discussions.Rmd')"
```

> **Note:** The scraping step must be completed first so that `data/all_comments.rds` exists before rendering the report.

---

## Notes on Language

The analysis report is intentionally written in **Spanish**, reflecting the academic context of the assignment and demonstrating the ability to work and communicate technical content in a non-native language.

---

## Academic Context

- Exploratory text analysis
- Topic modeling (LDA)
- User-generated online content
- Qualitative interpretation of unsupervised models

---

## Author

**Virlan Valentino**
2025
