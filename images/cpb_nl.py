import pandas as pd
import matplotlib.pyplot as plt


dc = pd.read_excel("../data/data.xlsx", sheetname="cbp_nl",
                     index_col=0, parse_cols=[0, 1, 2, 3, 4, 5]).dropna()
dc.columns = ["World", "US", "EU", "EM-Asia"]



# charts
def gen_chart(df, title, y_title, date_ini):
    """"""
    plt.style.use("ggplot")
    dn = df[df.index >= date_ini]
    df_final = dn.div(dn.iloc[0,:], axis=1)

    # Choose colors from http://colorbrewer2.org/ under "Export"
    fig = plt.figure()
    ax = fig.add_subplot(111)
    df_final.plot(ax=ax,linewidth=2, legend=True)
    #df_final.iloc[:, 0].plot(ax=ax, color='blue', linewidth=2)
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
    ax.set_xlim(ax.get_xlim()[0]-2, ax.get_xlim()[1]+ 2)

    # label
    fig.tight_layout()
    return fig

# vix
date_ini = "2015-01-01"
fig_vix = gen_chart(dc, "Global Industrial Production", "%", date_ini)
plt.savefig("cpb_nl.png")
