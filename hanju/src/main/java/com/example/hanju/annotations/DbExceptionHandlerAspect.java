package com.example.hanju.annotations;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Aspect
@Component
public class DbExceptionHandlerAspect {

    private static final Logger logger = LogManager.getLogger(DbExceptionHandlerAspect.class);

    @Around("@annotation(DbExceptionHandle)")
    public Object handleException(ProceedingJoinPoint joinPoint) throws Throwable {
        Map<String, Object> result = new HashMap<>();
        try {
            return joinPoint.proceed();  // 메소드 실행
        } catch (EmptyResultDataAccessException e) {
            logger.warn("No data found: {}", e.getMessage());
            result.put("status", "error");
            result.put("message", "조회된 데이터가 없습니다.");
        } catch (BadSqlGrammarException e) {
            logger.error("SQL syntax error: {}", e.getMessage());
            result.put("status", "error");
            result.put("message", "SQL 문법 오류가 발생했습니다.");
        } catch (DataAccessException e) {
            logger.error("Database access error: {}", e.getMessage());
            result.put("status", "error");
            result.put("message", "데이터베이스 접근 중 오류가 발생했습니다.");
        } catch (Exception e) {
            logger.error("Unexpected error: {}", e.getMessage());
            result.put("status", "error");
            result.put("message", "알 수 없는 오류가 발생했습니다.");
        }
        return result;
    }
}