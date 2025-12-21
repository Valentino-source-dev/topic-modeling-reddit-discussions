# Topic Modeling of Online Discussions using LDA

This repository contains an exploratory text analysis project focused on **topic modeling of online discussions** using **Latent Dirichlet Allocation (LDA)**.

The project analyzes a large corpus of real user-generated texts extracted from Reddit, with the aim of automatically identifying the main latent themes present in informal online conversations.

---

## Project Overview

In this work, I collected and analyzed textual data from online discussions in order to explore recurring thematic patterns. Online forums were chosen as the object of study because they provide spontaneous, unstructured opinions and arguments produced naturally by users.

The analysis follows an exploratory approach and places particular emphasis on the **qualitative interpretation of topics**, rather than on predictive performance.

---

## Data Collection

- Source: **Reddit**
- Selected subreddits:  
  - `technology`  
  - `space`  
  - `TeslaMotors`

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

- **K = 5 topics**
- **K = 10 topics**

The comparison highlights the trade-off between:
- broader, more interpretable themes (K = 5)
- higher thematic granularity but increased overlap (K = 10)

The final discussion favors the **K = 5 solution**, which provides a more stable and coherent thematic structure for exploratory purposes.

---

## Topic Interpretation

Topics are interpreted through:
- inspection of the most probable terms per topic
- qualitative labeling based on semantic coherence
- analysis of representative documents with high topic probability

The identified themes reflect recurring discussions around:
- digital economy and technology consumption
- work and everyday online experiences
- criticism of technology companies and economic dynamics
- data, privacy, and digital services
- pragmatic evaluations of software and artificial intelligence

Rather than rigid categories, the topics represent **flexible clusters of discourse**, consistent with the informal and overlapping nature of online conversations.

---

## Repository Contents

- `topic-modeling-lda.html`  
  Rendered HTML report containing the full analysis, results, and interpretations.  
  The document is written in **Spanish**.

- `README.md`  
  Project description and documentation.

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
