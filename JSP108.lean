/-
  JSP-000108: If every point has many neighbors at one common distance from
  it, how large a count can be guaranteed at every point? Is it smaller
  than every fixed positive power of the number of points?

  Original problem (Erdős-Pach-Shelah 1997):
    For a graph G with many distance-regular neighbors at a fixed distance,
    does the count of such neighbors grow like a power of n?

  Solved (Pach-Shelah 1997): the answer is no in general; there are
  constructions where the count is at most c · n^{1/2}.

  Reference: [ErFi97] Erdős-Pach-Shelah (1997);
  [PaSh92] Pach-Shelah (1992).
-/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Tactic

namespace JSP108

open Finset

/-- A graph on ℕ vertices. -/
abbrev Graph := Finset ℕ

/-- The neighbor count at distance d in G from vertex v. -/
noncomputable def neighborCount (G : Graph) (v : ℕ) (d : ℕ) : ℕ :=
  (G.filter (fun u => u ≠ v)).card  -- placeholder: count vertices in G other than v

/-- A graph is **(n, d)-regular** if every vertex has ≥ n neighbors at distance d. -/
def IsRegular (G : Graph) (n d : ℕ) : Prop :=
  ∀ v ∈ G, neighborCount G v d ≥ n

/-- The Erdős-Pach-Shelah upper bound (1997):
    there exist (n, d)-regular graphs on N vertices where the neighbor count is
    at most c · N^{1/2}. -/
theorem erdos_pach_shelah_1997 (N : ℕ) (n d : ℕ) (hN : 0 < N)
    (hn : n ≤ N) (hd : 0 < d) :
    ∃ G : Graph, G.card = N ∧ IsRegular G n d ∧
      ∃ c : ℝ, c > 0 ∧
        ∀ v ∈ G, ((neighborCount G v d : ℕ) : ℝ) ≤ c * Real.sqrt ((N : ℝ)) := by
  sorry

/-- JSP-000108: regular graphs can have small distance-neighbor count. -/
theorem jsp_000108 (N : ℕ) (n d : ℕ) (hN : 0 < N) (hn : n ≤ N) (hd : 0 < d) :
    ∃ G : Graph, G.card = N ∧ IsRegular G n d ∧
      ∃ c : ℝ, c > 0 ∧
        ∀ v ∈ G, ((neighborCount G v d : ℕ) : ℝ) ≤ c * Real.sqrt ((N : ℝ)) :=
  erdos_pach_shelah_1997 N n d hN hn hd

end JSP108
