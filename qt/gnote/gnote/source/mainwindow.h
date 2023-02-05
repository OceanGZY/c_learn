#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSplitter>
#include <QMenuBar>
#include <QToolBar>
#include <QToolButton>
#include <QTextEdit>
#include "editorcore.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

    QSplitter *_spliterMainView;

    QMenuBar *_menuBar;
    QToolBar *_toolBar;

    EditorCore *textEditIn;

    QTextEdit *textEditOut;

public slots:
    void textContent();

private:
    Ui::MainWindow *ui;
};
#endif // MAINWINDOW_H
