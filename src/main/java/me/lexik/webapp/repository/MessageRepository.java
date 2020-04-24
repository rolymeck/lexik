package me.lexik.webapp.repository;

import me.lexik.webapp.domain.Message;
import me.lexik.webapp.domain.User;
import me.lexik.webapp.domain.dto.MessageDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Long> {

    @Query("select new me.lexik.webapp.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "group by m " +
            "order by m.id desc")
    List<MessageDto> findAll(@Param("user") User user);

    @Query("select new me.lexik.webapp.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "where m.tag = :tag " +
            "group by m " +
            "order by m.id desc")
    List<MessageDto> findByTag(@Param("tag") String tag, @Param("user") User user);

    @Query("select new me.lexik.webapp.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "where m.author = :author " +
            "group by m " +
            "order by m.id desc")
    List<MessageDto> findByUser(@Param("author") User author, @Param("user") User user);
}
