import pandas as pd
import matplotlib.pyplot as plt


dt = pd.read_excel("../data/data.xlsx", sheetname="10yearsT",
                     index_col=0, skiprows=[0, 1], parse_cols=[0, 1]).dropna()
dt.columns = ["10Years Tresury"]


# charts
def gen_chart(df, title, y_title, date_ini):
    """"""
    plt.style.use("ggplot")
    df_final = df[df.index >= date_ini]

    # Choose colors from http://colorbrewer2.org/ under "Export"
    fig = plt.figure()
    ax = fig.add_subplot(111)
    df_final.iloc[:, 0].plot(ax=ax, color='blue', linewidth=2)
    # df_final.iloc[:, 1].plot(ax=ax, color='orange', linewidth=2,
    #                          style='--', legend=True)

    # labels labels
    for label in ax.xaxis.get_ticklabels():
        label.set_fontsize(14)
    for label in ax.yaxis.get_ticklabels():
        label.set_fontsize(14)

    # title
    ax.set_title(title, fontsize=24)
    ax.title.set_position([.5,1.03])

    #margins
    ax.margins(0.0, 0.2)
    ax.set_xlim(ax.get_xlim()[0]-5, ax.get_xlim()[1]+ 5)

    # label
    fig.tight_layout()
    return fig

# vix
date_ini = "2010-12-01"
ig_vix = gen_chart(dt, "10 Years Treasury", "%", date_ini)
plt.savefig("./10Years.png")
