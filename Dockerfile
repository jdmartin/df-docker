FROM ubuntu:lunar

#Build Oct 12, 2023

RUN apt-get update \
    && apt-get install locales libncursesw5 dwarf-fortress --no-install-recommends -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && LC_ALL=C locale-gen en_US.UTF-8 \
    && sed -e 's/\[PRINT_MODE:2D\]/[PRINT_MODE:TEXT]/' \
           -e 's/\[TRUETYPE:[0-9]*\]/[TRUETYPE:NO]/' \
           -e 's/\[SOUND:YES\]/[SOUND:NO]/' \
           -e 's/\[INTRO:YES\]/[INTRO:NO]/' \
           -i /usr/share/games/dwarf-fortress/gamedata/data/init/init.txt \
    && sed -e 's/^\.\/libs\/Dwarf_Fortress/exec \0/' \
           -i /usr/games/dwarf-fortress

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8 \
    TERM=xterm-256color

WORKDIR /usr/games

CMD ["/usr/games/dwarf-fortress"]
