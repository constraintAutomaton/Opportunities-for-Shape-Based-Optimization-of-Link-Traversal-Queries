# Opportunities for Shape-based Optimization of Traversal Queries over Decentralized Environments

Short paper submitted for the ["Alberto Mendelzon International Workshop on Foundations of Data Management"](https://amw2024.github.io/). 
The experiment repository is available via [this hypermedia link](https://github.com/constraintAutomaton/amw_shape_index_results/tree/main).

## Building a PDF
The authors compiled the PDF version using `pdflatex` (you can use your favorite latex compiler).
We created a `makefile` to facilitate the building of the PDF version.
One can simply execute `make main.pdf` or `make` to produce the PDF version if `pdflatex` and the other dependencies of the [TeX Live](https://tug.org/texlive/) suite are installed on the machine of the user.

## Abstract
<p style="text-align: justify"> 
    Data on the web is naturally unindexed and decentralized.
    Centralizing web data, especially personal data, raises ethical and legal concerns.
    Yet, compared to centralized query approaches,
    decentralization-friendly alternatives such as Link Traversal Query Processing (LTQP)
    are significantly less performant and understood.
    The two main difficulties of LTQP are the lack of apriori information about data sources and the high number of HTTP requests.
    Exploring decentralized-friendly ways to document unindexed networks of data sources could lead to solutions to alleviate those difficulties.
    RDF data shapes are widely used to validate linked data documents, therefore, it is worthwhile to investigate their potential for LTQP optimization.
    In our work, we built an early version of a source selection algorithm for LTQP using RDF data shape mappings with linked data documents and measured its performance in a realistic setup.
    In this article, we present our algorithm and early results, thus, opening opportunities for further research for shape-based optimization of link traversal queries.
    Our initial experiments show that with little maintenance and work from the server, our method can reduce up to 80% the execution time and 97% the number of links traversed during realistic queries.
    Given our early results and the descriptive power of RDF data shapes it would be worthwhile to investigate non-heuristic-based query planning
    using RDF shapes. 
</p>

## Results
Figure presenting the main result.

![figure displaying the main results](figure/combined.svg)
  The execution time with shape indexes is consistently lower (up to 80\% with D1V3 and S1V3) or equal to with the type indexes (except for D3V3 and D3V4), and always uses fewer HTTP requests.



## Conclusion 

<p style="text-align: justify"> 
The shape index approach shows that more precise source selection in LTQP can significantly reduce query execution time.
Although it is still an early effort, we believe that a solution inspired by our approach could be beneficial for the query and publication of fragmented document-based linked data.
Our solution does not require extensive computational power from the data publisher during queries and updates of data sources.
Additionally, using a shape index holds promise to improve the data quality of fragmented document-based linked data.
There are still multiple questions left to be answered such as how to handle private data, what is the overhead and the complexity of the method,
can the shape index alone or with other data summarisation structures be used to improve query planning without sacrificing query execution times.


</p>
## How to cite

```bib
@misc{tam2024opportunitiesshapebasedoptimizationlink,
      title={Opportunities for Shape-based Optimization of Link Traversal Queries}, 
      author={Bryan-Elliott Tam and Ruben Taelman and Pieter Colpaert and Ruben Verborgh},
      year={2024},
      eprint={2407.00998},
      archivePrefix={arXiv},
      primaryClass={cs.DB},
      url={https://arxiv.org/abs/2407.00998}, 
}
```
