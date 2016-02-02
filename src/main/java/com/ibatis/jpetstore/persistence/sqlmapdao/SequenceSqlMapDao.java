package com.ibatis.jpetstore.persistence.sqlmapdao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.jpetstore.domain.Sequence;
import com.ibatis.jpetstore.persistence.iface.SequenceDao;

@Repository
public class SequenceSqlMapDao implements SequenceDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * This is a generic sequence ID generator that is based on a database table
	 * called 'SEQUENCE', which contains two columns (NAME, NEXTID).
	 * <p/>
	 * This approach should work with any database.
	 *
	 * @param name
	 *            The name of the sequence.
	 * @return The Next ID @
	 */
	public synchronized int getNextId(String name) {
		Sequence sequence = new Sequence(name, -1);
		sequence = sqlSessionTemplate.selectOne("Sequence.getSequence", sequence);
		if (sequence == null) {
			throw new RuntimeException("Error: A null sequence was returned from the database (could not get next " + name
					+ " sequence).");
		}
		Object parameterObject = new Sequence(name, sequence.getNextId() + 1);
		sqlSessionTemplate.update("Sequence.updateSequence", parameterObject);

		return sequence.getNextId();
	}

}
