# Branching workflow

One branch per internship week, merged into `main` when that week's
deliverable is complete. `main` should always be either empty scaffolding or
fully-merged, reviewed weeks — never partially-done work.

## Branch naming

```
weekNN-topic-slug
```

- `NN` is zero-padded (`02`, not `2`) so branches sort in order — Week 1 is
  the one exception already on GitHub (`week1-customer-churn-analysis`).
- `topic-slug` is a short kebab-case description of that week's task, e.g.
  `week05-feature-engineering`, `week09-model-deployment`.

## Starting a new week

```bash
git checkout main
git pull origin main
./scripts/new-week.sh 05 feature-engineering   # creates + checks out week05-feature-engineering
```

Or manually:

```bash
git checkout main
git pull origin main
git checkout -b week05-feature-engineering
```

## During the week

- Commit as you go with descriptive messages (see Week 1's history for the
  style: what was added and why).
- Keep the week's notebook at
  `notebooks/AnalystLab_Africa_WeekN_<Topic>.ipynb`.
- Push the branch to `origin` regularly so work isn't only local:

```bash
git push -u origin week05-feature-engineering
```

## Finishing a week

1. Push the final commits.
2. Open a PR from `weekNN-topic-slug` into `main` on GitHub (this gives a
   reviewable record of each week, matching the submission checklist).
3. Merge the PR (fast-forward or merge commit — don't squash away the week's
   commit history).
4. Update the roadmap table in [README.md](README.md): mark the week
   ✅ Merged and fill in the real topic if it was a placeholder.
5. Leave the branch on GitHub after merging — it's a record of that week's
   submission, not scratch work to delete.

## Final step — after Week 12

Once every `weekNN-*` branch is merged into `main`, `main` contains the full
12-week history in order. No separate "merge everything" step is needed if
each week was merged as it finished; that's the point of doing it
incrementally instead of all at once at the end.
