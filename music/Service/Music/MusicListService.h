#ifndef MUSICLISTSERVICE_H
#define MUSICLISTSERVICE_H

#include "MusicRepertory.h"
#include <QDir>

class MusicListService : public QObject
{
    Q_OBJECT
public:
    static MusicListService* instance();

    QList<MusicBase *> getList();

    MusicBase *get(QString id);
    MusicBase *get(int index);

    /*Gets the list of paths where the music is located.*/
    void add(QStringList pathList);
    void add(MusicBase *musicBase);
    void remove(QString id);
    void update(MusicBase *musicBase);
    bool isExistMusic(QString pathName);

    QMediaPlaylist *getMediaPlayList();
    void setCurrentPlayMusicId(QString musicId);

    QString getLyricFilPath();

signals:
    void listChanged();

private:
    MusicListService();
    QStringList getMusicTypeFilter();
    QStringList getlyrcTypeFilter();

private:
    static MusicListService* _instance;
    QDir m_musicDir;
    QFileInfo m_fileInfo;
};

#endif // MUSICLISTSERVICE_H
