---
name: "Grapheme-aware calendar rendering and alignment"
head: table_handling
base: main
body: |
  This PR makes calendar printing grapheme-cluster-aware so Devanagari
  (and other multi-codepoint glyphs) render in properly aligned columns.

  Changes:
  - Add Text::CharWidth usage and grapheme-aware helpers (_display_width,
    _truncate_to_width) to lib/NepaliDateTime/Date.pm
  - Update print_calendar() to use grapheme-aware centering/padding/truncation
  - Add test t/99_table_render.t which captures a devanagari calendar and
    asserts display-width alignment
  - Add Text::CharWidth to PREREQ_PM in Makefile.PL

  Notes:
  - AD <-> BS conversion code was reviewed and left unchanged (tests already
    cover round-trip conversions).
  - If you prefer Text::CharWidth to be optional, I can update the PR to
    make it a runtime-optional dependency (eval require) instead of a
    hard prereq.

  Please review.
---
