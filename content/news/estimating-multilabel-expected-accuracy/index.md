---
title: "How Confident Is Your Multi-Label Classifier? Estimating Expected Accuracy from Label Distributions"
date: 2025-01-01
draft: false
tags: ["machine learning", "multi-label classification", "probabilistic models", "uncertainty", "research"]
categories: ["Research"]
description: "When a multi-label classifier makes a prediction, how do you know how much to trust it? A new study from Western Sydney University and École Polytechnique investigates seven candidate functions for estimating expected accuracy — and finds that the answer depends on how you measure accuracy."
author: "Laurence A. F. Park and Jesse Read"
cover: "multilabel-confidence.svg"
---

When a multi-label classifier makes a prediction — say, flagging a patient record for Diabetes, Hypertension, *and* COVID-19 — how confident should you be? This question is harder than it looks. In a single-label setting, the probability score attached to a prediction is a straightforward measure of confidence. In the multi-label world, it gets complicated fast.

A new paper by **Laurence A. F. Park** (Western Sydney University) and **Jesse Read** (École Polytechnique) takes a rigorous look at this problem, testing seven candidate functions for estimating expected accuracy from a multi-label probability distribution — and finding clear winners depending on how accuracy is measured.

---

## The Problem: Confidence in a Multi-Label World

A probabilistic multi-label classifier doesn't just output a single label; it produces a distribution over every possible *combination* of labels (the powerset). For *L* labels, that's 2^L combinations. The classifier assigns a probability to each one.

The standard practice is to report the probability of the single most likely combination — the mode — as the confidence score. But this ignores the shape of the entire distribution. Imagine a classifier that gives 35% to `[Diabetes, Hypertension]` and 34% to `[Diabetes only]`. Technically, the first combination "wins," but the near-tie should erode your confidence considerably.

More importantly, multi-label accuracy can be measured in several ways, and the right confidence measure should align with the evaluation metric in use.

The paper studies three widely used metrics:

- **Hamming Similarity** — counts how many individual labels were correctly classified (true negatives count)
- **Exact Match** — a prediction is only correct if *every* label matches exactly
- **Jaccard Similarity** — intersection over union; true negatives don't count

---

## Seven Candidate Confidence Functions

The authors propose a framework: a good confidence function *f* should return 0 for a uniform (maximally uncertain) distribution, and 1 when a single combination has all the probability mass. Everything in between is where the candidates diverge.

The seven candidates tested are:

1. **High Probability (HP)** — the probability of the mode labelset (current de facto standard)
2. **Top Gap (TG)** — the difference in probability between the top two combinations
3. **Shannon Entropy (SE)** — classic information-theoretic uncertainty measure, inverted
4. **Collision Entropy (CE)** — Rényi entropy with α = 2, related to the sum of squared probabilities
5. **Min Entropy (ME)** — based solely on the single highest probability
6. **Gini Impurity (GI)** — borrowed from decision tree theory
7. **Chi-Squared Statistic (CS)** — measures deviation from a uniform distribution

One elegant finding: **Chi-Squared and Gini Impurity are mathematically equivalent** in this setting, so effectively six distinct functions are in play.

---

## What the Experiments Found

The study evaluated all seven functions across six datasets (covering audio, image, biology, medical, and text domains), three classification methods ranging from fully independent label models to fully-dependent ensemble chains, and all three accuracy metrics.

### Which function correlates best with true expected accuracy?

For **Hamming Similarity**, most candidate functions worked well — High Probability, Shannon Entropy, and Collision Entropy all delivered strong results.

For **Jaccard Similarity**, **Shannon Entropy** stood out as significantly better than the baseline High Probability approach.

For **Exact Match**, no single function clearly beat High Probability — but a *mixture* of functions did.

### Which function is most robust?

Robustness matters in practice: you want a confidence score that holds up regardless of the dataset characteristics or classifier choice.

- **Top Gap** was the least robust, sensitive to label count, label cardinality, feature count, and classifier type.
- **Collision Entropy and Chi-Squared** were the most robust, showing minimal sensitivity to changes in experimental conditions.
- **Shannon Entropy** was somewhat affected by label cardinality and feature count — but in a *positive* direction, meaning SE improves on larger, richer datasets.

### When to combine functions

For the hardest cases — Jaccard and Exact Match accuracy — no single function reliably maps to a calibrated accuracy estimate. The authors fit logistic regression models using individual and combined candidate functions and found that **a mixture of HP, SE, and CE** produces the best-calibrated estimates, with the predicted confidence intervals closely matching true accuracy ranges across held-out data.

For Hamming Similarity, individual functions suffice. For Jaccard and Exact Match, reach for the mixture.

---

## Key Takeaways

| Metric | Best Single Function | Most Robust | Use Mixture? |
|---|---|---|---|
| Exact Match | HP, SE, CE, ME, CS | CE, CS | ✓ |
| Hamming Similarity | HP, SE, CE, ME, CS | CE, CS | ✗ |
| Jaccard Similarity | Shannon Entropy | CE, CS | ✓ |

**Practical implications:**

- Don't just use the mode probability as your confidence score — at minimum, consider Shannon or Collision Entropy.
- If your application uses Jaccard Similarity (common in tagging and retrieval tasks), Shannon Entropy is a significantly better confidence indicator.
- For calibrated probability estimates of expected accuracy, combine multiple functions via a fitted logistic regression model.
- Top Gap, despite its intuitive appeal, consistently underperforms relative to simpler alternatives — avoid it.

---

## A Note on Scale

One important caveat: computing the full powerset distribution over all 2^L label combinations becomes intractable for large *L*. The experiments in this paper were limited to datasets with at most 25 labels, specifically to avoid bias in sample-based entropy estimation. Extending these methods to extreme multi-label settings (hundreds or thousands of labels) remains an open problem.

---

## About the Research

This work builds on a line of research connecting multi-label classification confidence to information-theoretic measures. It extends prior work on entropy as an acceptance measure for multi-label classification, and draws connections to techniques from particle filtering and conformal prediction.

**Laurence A. F. Park** is an Associate Professor of Computational Mathematics and Statistics at Western Sydney University's School of Computer, Data and Mathematical Sciences, and a member of the Centre for Research in Mathematics and Data Science.

**Jesse Read** is a Professor in the Computer Science Laboratory (LIX) at École Polytechnique, Institut Polytechnique de Paris. He is known for his work on classifier chains and leads the MEKA open-source multi-label classification framework.

---

*The full paper, including appendices with derivations and additional experimental tables, is available in the [authors' publications repository](https://github.com/lafpark/publications/blob/main/acceptanceCandidates2025.pdf).*
