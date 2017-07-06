import pandas as pd
import matplotlib.pyplot as plt


dc = pd.read_excel("../data/data.xlsx", sheetname="EU_US_cpi",
                     index_col=0, skiprows=[0, 1], parse_cols=[0, 1, 2]).dropna()
dc.columns = ["US", "EU"]
dci = dc.pct_change(periods=12).dropna()*100

# charts
def gen_chart(df, title, y_title, date_ini):
    """"""
    plt.style.use("ggplot")
    df_final = df[df.index >= date_ini]

    # Choose colors from http://colorbrewer2.org/ under "Export"
    fig = plt.figure()
    ax = fig.add_subplot(111)
    df_final.iloc[:, 0].plot(ax=ax, color='red', linewidth=2, legend=True)
    df_final.iloc[:, 1].plot(ax=ax, color='orange', linewidth=2, legend=True)

    # labels labels
    for label in ax.xaxis.get_ticklabels():
        label.set_fontsize(14)
    for label in ax.yaxis.get_ticklabels():
        label.set_fontsize(14)

    # title
    ax.set_title(title, fontsize=24)
    ax.title.set_position([.5,1.03])
    ax.set_ylabel(y_title)
    ax.set_xlabel('')

    #margins
    ax.margins(0.0, 0.2)
    ax.set_xlim(ax.get_xlim()[0]-5, ax.get_xlim()[1]+ 5)

    # label
    fig.tight_layout()
    return fig

# vix
date_ini = "2012-06-01"
fig_cli = gen_chart(dci, "CPI Inflation", "%", date_ini)
plt.savefig("./cpi_eu_us.png")
